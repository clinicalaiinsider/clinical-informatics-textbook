#!/usr/bin/env python3
"""
Patient Registration Service
Community Health Clinic EHR Integration

Chapter: 1 - Patient Registration
Textbook Section: 1.5 Python Implementation

This module handles patient registration operations including:
- Patient search and matching
- New patient creation
- Insurance eligibility verification
- Encounter initialization

Prerequisites:
    pip install httpx pydantic fhir.resources

Usage:
    python patient_registration_service.py
"""

from datetime import date, datetime
from typing import Optional, List
from pydantic import BaseModel, Field
import httpx
from fhir.resources.patient import Patient
from fhir.resources.coverage import Coverage
from fhir.resources.encounter import Encounter

# Configuration
FHIR_SERVER_URL = "https://fhir.communityhealthclinic.org/fhir"


class PatientDemographics(BaseModel):
    """Demographics input for patient registration."""
    first_name: str = Field(..., min_length=1, max_length=100)
    last_name: str = Field(..., min_length=1, max_length=100)
    date_of_birth: date
    gender: str = Field(..., pattern="^(male|female|other|unknown)$")
    address_line: Optional[str] = None
    city: Optional[str] = None
    state: Optional[str] = Field(None, pattern="^[A-Z]{2}$")
    postal_code: Optional[str] = None
    phone_home: Optional[str] = None
    phone_work: Optional[str] = None
    medicaid_id: Optional[str] = None


class PatientSearchResult(BaseModel):
    """Result from patient search."""
    patient_id: str
    name: str
    date_of_birth: date
    mrn: str
    match_score: float = Field(..., ge=0, le=1)


class RegistrationService:
    """
    Handles patient registration workflow.

    This service coordinates:
    1. Patient search/matching in MPI
    2. New patient creation
    3. Insurance eligibility verification
    4. Encounter initialization
    """

    def __init__(self, fhir_client: httpx.AsyncClient):
        self.client = fhir_client
        self.base_url = FHIR_SERVER_URL

    async def search_patient(
        self,
        last_name: str,
        date_of_birth: date,
        first_name: Optional[str] = None
    ) -> List[PatientSearchResult]:
        """
        Search for existing patient in MPI.

        Args:
            last_name: Patient's family name
            date_of_birth: Patient's birth date
            first_name: Optional given name for narrower search

        Returns:
            List of potential matches with confidence scores
        """
        params = {
            "family": last_name,
            "birthdate": date_of_birth.isoformat()
        }
        if first_name:
            params["given"] = first_name

        response = await self.client.get(
            f"{self.base_url}/Patient",
            params=params
        )
        response.raise_for_status()

        bundle = response.json()
        results = []

        for entry in bundle.get("entry", []):
            patient = entry["resource"]
            # Calculate match score based on field matching
            score = self._calculate_match_score(
                patient, last_name, date_of_birth, first_name
            )

            results.append(PatientSearchResult(
                patient_id=patient["id"],
                name=self._format_name(patient["name"][0]),
                date_of_birth=date.fromisoformat(patient["birthDate"]),
                mrn=self._extract_mrn(patient),
                match_score=score
            ))

        return sorted(results, key=lambda x: x.match_score, reverse=True)

    async def register_patient(
        self,
        demographics: PatientDemographics
    ) -> Patient:
        """
        Register a new patient in the EHR.

        Args:
            demographics: Patient demographic information

        Returns:
            Created FHIR Patient resource
        """
        patient = Patient(
            name=[{
                "use": "official",
                "family": demographics.last_name,
                "given": [demographics.first_name]
            }],
            birthDate=demographics.date_of_birth.isoformat(),
            gender=demographics.gender,
            telecom=[],
            address=[]
        )

        # Add phone numbers if provided
        if demographics.phone_home:
            patient.telecom.append({
                "system": "phone",
                "value": demographics.phone_home,
                "use": "home"
            })
        if demographics.phone_work:
            patient.telecom.append({
                "system": "phone",
                "value": demographics.phone_work,
                "use": "work"
            })

        # Add address if provided
        if demographics.address_line:
            patient.address.append({
                "use": "home",
                "line": [demographics.address_line],
                "city": demographics.city,
                "state": demographics.state,
                "postalCode": demographics.postal_code
            })

        # Create patient in FHIR server
        response = await self.client.post(
            f"{self.base_url}/Patient",
            json=patient.dict(exclude_none=True)
        )
        response.raise_for_status()

        created_patient = Patient.parse_obj(response.json())

        # If Medicaid ID provided, create coverage resource
        if demographics.medicaid_id:
            await self._create_medicaid_coverage(
                created_patient.id,
                demographics.medicaid_id
            )

        return created_patient

    async def verify_eligibility(
        self,
        medicaid_id: str,
        service_date: date
    ) -> dict:
        """
        Verify Medicaid eligibility via X12 270/271.

        Args:
            medicaid_id: Patient's Medicaid identifier
            service_date: Date of service for eligibility check

        Returns:
            Eligibility response with coverage details
        """
        # In production, this would call an eligibility clearinghouse
        # For demonstration, a simulated response is returned
        return {
            "status": "active",
            "coverage_start": "2025-01-01",
            "coverage_end": "2026-12-31",
            "plan_name": "Meridian Health Plan of Illinois",
            "copay": 0,
            "prior_auth_required": False
        }

    async def create_encounter(
        self,
        patient_id: str,
        provider_id: str,
        reason: str
    ) -> Encounter:
        """
        Initialize an encounter for the patient visit.

        Args:
            patient_id: FHIR Patient resource ID
            provider_id: FHIR Practitioner resource ID
            reason: Chief complaint or reason for visit

        Returns:
            Created FHIR Encounter resource
        """
        encounter = Encounter(
            status="arrived",
            class_fhir={
                "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                "code": "AMB",
                "display": "ambulatory"
            },
            subject={"reference": f"Patient/{patient_id}"},
            participant=[{
                "type": [{
                    "coding": [{
                        "system": "http://terminology.hl7.org/CodeSystem/v3-ParticipationType",
                        "code": "ATND"
                    }]
                }],
                "individual": {"reference": f"Practitioner/{provider_id}"}
            }],
            period={"start": datetime.now().isoformat()},
            reasonCode=[{"text": reason}]
        )

        response = await self.client.post(
            f"{self.base_url}/Encounter",
            json=encounter.dict(exclude_none=True)
        )
        response.raise_for_status()

        return Encounter.parse_obj(response.json())

    def _calculate_match_score(
        self,
        patient: dict,
        last_name: str,
        dob: date,
        first_name: Optional[str]
    ) -> float:
        """Calculate probabilistic match score."""
        score = 0.0

        # Name matching (40% weight)
        patient_name = patient["name"][0]
        if patient_name.get("family", "").lower() == last_name.lower():
            score += 0.25
        if first_name and first_name.lower() in [
            n.lower() for n in patient_name.get("given", [])
        ]:
            score += 0.15

        # DOB matching (40% weight)
        if patient["birthDate"] == dob.isoformat():
            score += 0.40

        # Gender consistency (10% weight)
        if patient.get("gender"):
            score += 0.10

        # Has identifiers (10% weight)
        if patient.get("identifier"):
            score += 0.10

        return min(score, 1.0)

    def _format_name(self, name: dict) -> str:
        """Format FHIR HumanName to display string."""
        given = " ".join(name.get("given", []))
        family = name.get("family", "")
        return f"{given} {family}".strip()

    def _extract_mrn(self, patient: dict) -> str:
        """Extract MRN from patient identifiers."""
        for identifier in patient.get("identifier", []):
            if identifier.get("type", {}).get("coding", [{}])[0].get("code") == "MR":
                return identifier.get("value", "")
        return ""

    async def _create_medicaid_coverage(
        self,
        patient_id: str,
        medicaid_id: str
    ) -> Coverage:
        """Create Coverage resource for Medicaid enrollment."""
        coverage = Coverage(
            status="active",
            type={
                "coding": [{
                    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                    "code": "SUBSIDMC"
                }]
            },
            subscriber={"reference": f"Patient/{patient_id}"},
            beneficiary={"reference": f"Patient/{patient_id}"},
            payor=[{"display": "Illinois Medicaid"}],
            identifier=[{
                "system": "http://illinois.gov/medicaid",
                "value": medicaid_id
            }]
        )

        response = await self.client.post(
            f"{self.base_url}/Coverage",
            json=coverage.dict(exclude_none=True)
        )
        response.raise_for_status()

        return Coverage.parse_obj(response.json())


# Example usage
async def main():
    """Demonstrate patient registration workflow."""
    async with httpx.AsyncClient() as client:
        service = RegistrationService(client)

        # Search for existing patient
        results = await service.search_patient(
            last_name="Rodriguez",
            date_of_birth=date(1979, 3, 15),
            first_name="Maria"
        )

        if results and results[0].match_score > 0.85:
            print(f"Found existing patient: {results[0].name}")
            patient_id = results[0].patient_id
        else:
            # Register new patient
            demographics = PatientDemographics(
                first_name="Maria",
                last_name="Rodriguez",
                date_of_birth=date(1979, 3, 15),
                gender="female",
                address_line="123 Main Street",
                city="Springfield",
                state="IL",
                postal_code="62701",
                phone_home="217-555-1234",
                medicaid_id="IL987654321"
            )
            patient = await service.register_patient(demographics)
            patient_id = patient.id
            print(f"Created new patient: {patient_id}")

        # Verify insurance eligibility
        eligibility = await service.verify_eligibility(
            medicaid_id="IL987654321",
            service_date=date.today()
        )
        print(f"Eligibility status: {eligibility['status']}")

        # Create encounter
        encounter = await service.create_encounter(
            patient_id=patient_id,
            provider_id="dr-sarah-chen",
            reason="Fatigue, elevated blood sugars, heart palpitations"
        )
        print(f"Created encounter: {encounter.id}")


if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
