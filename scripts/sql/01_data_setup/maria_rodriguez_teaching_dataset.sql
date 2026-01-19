-- =============================================================================
-- MARIA RODRIGUEZ TEACHING DATASET
-- Clinical Informatics Textbook Case Study - OMOP CDM 5.4
-- =============================================================================
--
-- This script creates a complete teaching dataset for Maria Rodriguez,
-- the primary patient case study in the Clinical Informatics Textbook.
--
-- Patient Profile:
--   - 46-year-old female elementary school teacher
--   - Type 2 Diabetes (3 years), Hypertension (5 years)
--   - New diagnosis: Atrial Fibrillation (discovered January 2026)
--   - Insurance: Medicaid
--
-- Clinical Timeline:
--   - Jan 13, 2026: PCP visit - AFib discovered on routine visit
--   - Jan 17, 2026: Cardiology consultation with Dr. Torres
--
-- Usage:
--   psql -d your_database -f maria_rodriguez_teaching_dataset.sql
--
-- Prerequisites:
--   - OMOP CDM 5.4 schema created (cdm schema)
--   - Vocabulary tables populated (vocabulary schema)
--
-- =============================================================================

-- Configuration: Adjust schema names if needed
SET search_path TO cdm, vocabulary, public;

-- =============================================================================
-- SECTION 1: LOCATION DATA
-- =============================================================================
-- Patient and care site locations

INSERT INTO cdm.location (
    location_id,
    address_1,
    city,
    state,
    zip,
    county,
    location_source_value,
    country_concept_id,
    country_source_value
) VALUES
-- Maria Rodriguez's home address
(90001, '123 Main Street', 'Springfield', 'IL', '62701', 'Sangamon', 'MARIA_HOME', 4330442, 'US'),
-- Community Health Clinic
(90002, '500 Health Center Drive', 'Springfield', 'IL', '62702', 'Sangamon', 'CHC_MAIN', 4330442, 'US'),
-- Springfield Cardiology Associates
(90003, '1200 Medical Center Blvd', 'Springfield', 'IL', '62704', 'Sangamon', 'CARDIO_CLINIC', 4330442, 'US')
ON CONFLICT (location_id) DO NOTHING;

-- =============================================================================
-- SECTION 2: CARE SITE DATA
-- =============================================================================
-- Healthcare facilities where Maria receives care

INSERT INTO cdm.care_site (
    care_site_id,
    care_site_name,
    place_of_service_concept_id,
    location_id,
    care_site_source_value,
    place_of_service_source_value
) VALUES
-- Community Health Clinic - Primary Care
(80001, 'Community Health Clinic', 8717, 90002, 'CHC-MAIN', 'Outpatient Clinic'),
-- Springfield Cardiology Associates
(80002, 'Springfield Cardiology Associates', 8717, 90003, 'CARDIO-SA', 'Cardiology Office')
ON CONFLICT (care_site_id) DO NOTHING;

-- =============================================================================
-- SECTION 3: PROVIDER DATA
-- =============================================================================
-- Healthcare providers involved in Maria's care
-- Specialty concept IDs from OMOP vocabulary:
--   38004446 = Family Medicine
--   38004451 = Internal Medicine/Cardiology
--   38004445 = Nursing (RN)
--   38004509 = Pharmacist

INSERT INTO cdm.provider (
    provider_id,
    provider_name,
    npi,
    specialty_concept_id,
    care_site_id,
    year_of_birth,
    gender_concept_id,
    provider_source_value,
    specialty_source_value
) VALUES
-- Dr. Sarah Chen, MD - Family Medicine (Primary Care Physician)
(70001, 'Sarah Chen, MD', '1234567890', 38004446, 80001, 1978, 8532, 'CHEN_SARAH_MD', 'Family Medicine'),
-- Lisa Brown, RN - Care Coordinator
(70002, 'Lisa Brown, RN', NULL, 38004445, 80001, 1985, 8532, 'BROWN_LISA_RN', 'Registered Nurse'),
-- Dr. Michael Torres, MD, FACC - Cardiologist
(70003, 'Michael Torres, MD', '0987654321', 38004451, 80002, 1972, 8507, 'TORRES_MICHAEL_MD', 'Cardiology'),
-- Jessica Martinez, PharmD - Clinical Pharmacist
(70004, 'Jessica Martinez, PharmD', NULL, 38004509, 80001, 1990, 8532, 'MARTINEZ_JESSICA_PHARMD', 'Pharmacist')
ON CONFLICT (provider_id) DO NOTHING;

-- =============================================================================
-- SECTION 4: PERSON DATA
-- =============================================================================
-- Maria Rodriguez - Primary teaching case study patient
-- Gender: Female (8532), Race: White (8527), Ethnicity: Hispanic (38003563)

INSERT INTO cdm.person (
    person_id,
    gender_concept_id,
    year_of_birth,
    month_of_birth,
    day_of_birth,
    birth_datetime,
    race_concept_id,
    ethnicity_concept_id,
    location_id,
    provider_id,
    care_site_id,
    person_source_value,
    gender_source_value,
    race_source_value,
    ethnicity_source_value
) VALUES
(12345, 8532, 1979, 3, 15, '1979-03-15 00:00:00', 8527, 38003563, 90001, 70001, 80001,
 'MRN12345', 'Female', 'White', 'Hispanic or Latino')
ON CONFLICT (person_id) DO NOTHING;

-- =============================================================================
-- SECTION 5: OBSERVATION PERIOD
-- =============================================================================
-- Time period during which Maria is observed in the healthcare system

INSERT INTO cdm.observation_period (
    observation_period_id,
    person_id,
    observation_period_start_date,
    observation_period_end_date,
    period_type_concept_id
) VALUES
-- Observation period starting from first documented visit
(60001, 12345, '2021-01-01', '2026-12-31', 44814724)  -- 44814724 = Period covering healthcare encounters
ON CONFLICT (observation_period_id) DO NOTHING;

-- =============================================================================
-- SECTION 6: VISIT OCCURRENCE DATA
-- =============================================================================
-- Healthcare visits in Maria's care timeline
-- Visit concept IDs:
--   9202 = Outpatient Visit
--   32817 = EHR encounter record

INSERT INTO cdm.visit_occurrence (
    visit_occurrence_id,
    person_id,
    visit_concept_id,
    visit_start_date,
    visit_start_datetime,
    visit_end_date,
    visit_end_datetime,
    visit_type_concept_id,
    provider_id,
    care_site_id,
    visit_source_value,
    admitted_from_concept_id,
    discharged_to_concept_id
) VALUES
-- Visit 1: PCP Visit - Diabetes follow-up where AFib discovered (Chapter 2)
(900001, 12345, 9202, '2026-01-13', '2026-01-13 09:00:00', '2026-01-13', '2026-01-13 10:30:00',
 32817, 70001, 80001, 'V2026011301', 0, 0),

-- Visit 2: Cardiology Consultation with Dr. Torres (Chapter 4)
(900002, 12345, 9202, '2026-01-17', '2026-01-17 14:00:00', '2026-01-17', '2026-01-17 15:30:00',
 32817, 70003, 80002, 'V2026011702', 0, 0),

-- Visit 3: PCP Follow-up - 2 weeks post AFib diagnosis
(900003, 12345, 9202, '2026-01-27', '2026-01-27 10:00:00', '2026-01-27', '2026-01-27 10:45:00',
 32817, 70001, 80001, 'V2026012703', 0, 0),

-- Visit 4: Cardiology Follow-up - 4 weeks post initial
(900004, 12345, 9202, '2026-02-14', '2026-02-14 14:00:00', '2026-02-14', '2026-02-14 14:45:00',
 32817, 70003, 80002, 'V2026021404', 0, 0)
ON CONFLICT (visit_occurrence_id) DO NOTHING;

-- =============================================================================
-- SECTION 7: CONDITION OCCURRENCE DATA
-- =============================================================================
-- Maria's diagnoses mapped to SNOMED CT concepts
-- Condition type: 32817 = EHR encounter record
--
-- Standard SNOMED concept IDs:
--   201826 = Type 2 diabetes mellitus
--   320128 = Essential hypertension
--   433736 = Obesity (finding)
--   313217 = Atrial fibrillation
--
-- Source ICD-10-CM concept IDs:
--   45572061 = I48.91 (Unspecified atrial fibrillation)
--   45591829 = E11.9 (Type 2 DM without complications)
--   45577648 = I10 (Essential hypertension)
--   45567049 = E66.9 (Obesity, unspecified)

INSERT INTO cdm.condition_occurrence (
    condition_occurrence_id,
    person_id,
    condition_concept_id,
    condition_start_date,
    condition_start_datetime,
    condition_end_date,
    condition_type_concept_id,
    condition_status_concept_id,
    provider_id,
    visit_occurrence_id,
    condition_source_value,
    condition_source_concept_id
) VALUES
-- Type 2 Diabetes Mellitus - diagnosed 3 years prior (2023)
(900101, 12345, 201826, '2023-01-15', '2023-01-15 00:00:00', NULL,
 32817, 0, 70001, NULL, 'E11.9', 45591829),

-- Essential Hypertension - diagnosed 5 years prior (2021)
(900102, 12345, 320128, '2021-03-10', '2021-03-10 00:00:00', NULL,
 32817, 0, 70001, NULL, 'I10', 45577648),

-- Obesity - chronic condition
(900103, 12345, 433736, '2021-03-10', '2021-03-10 00:00:00', NULL,
 32817, 0, 70001, NULL, 'E66.9', 45567049),

-- Atrial Fibrillation - NEW DIAGNOSIS at January 13, 2026 visit
(900104, 12345, 313217, '2026-01-13', '2026-01-13 09:30:00', NULL,
 32817, 0, 70001, 900001, 'I48.91', 45572061)
ON CONFLICT (condition_occurrence_id) DO NOTHING;

-- =============================================================================
-- SECTION 8: MEASUREMENT DATA
-- =============================================================================
-- Vital signs and laboratory results
-- Measurement type: 32856 = Lab result, 32817 = EHR vital signs
--
-- LOINC to OMOP concept mappings:
--   3004249 = Systolic blood pressure (LOINC 8480-6)
--   3012888 = Diastolic blood pressure (LOINC 8462-4)
--   3027018 = Heart rate (LOINC 8867-4)
--   3024171 = Respiratory rate (LOINC 9279-1)
--   3020891 = Body temperature (LOINC 8310-5)
--   3025315 = Body weight (LOINC 29463-7)
--   3036277 = Body height (LOINC 8302-2)
--   3038553 = BMI (LOINC 39156-5)
--   40762499 = SpO2 (LOINC 2708-6)
--   3004501 = Random glucose (LOINC 2339-0)
--   3034639 = HbA1c (LOINC 4548-4)
--   3016723 = Creatinine (LOINC 2160-0)
--   3049187 = eGFR (LOINC 98979-8)
--   3019550 = TSH (LOINC 3016-3)
--   3000963 = Hemoglobin (LOINC 718-7)
--   3023314 = Hematocrit (LOINC 4544-3)
--   3010813 = WBC (LOINC 6690-2)
--   3024929 = Platelets (LOINC 777-3)
--
-- Unit concept IDs:
--   8876 = mmHg
--   8541 = beats/min (/min)
--   8483 = breaths/min
--   586323 = degrees Fahrenheit
--   8739 = pounds
--   8582 = cm
--   9531 = kg/m2
--   8554 = percent (%)
--   8840 = mg/dL
--   8837 = mIU/L
--   8713 = g/dL
--   8784 = cells/uL (10*3/uL)
--   8647 = mL/min/1.73m2

-- Visit 1: January 13, 2026 - PCP Visit (Chapter 2)
INSERT INTO cdm.measurement (
    measurement_id,
    person_id,
    measurement_concept_id,
    measurement_date,
    measurement_datetime,
    measurement_type_concept_id,
    value_as_number,
    unit_concept_id,
    range_low,
    range_high,
    provider_id,
    visit_occurrence_id,
    measurement_source_value,
    unit_source_value
) VALUES
-- Vital Signs at PCP Visit (01/13/2026)
(9000001, 12345, 3004249, '2026-01-13', '2026-01-13 09:15:00', 32817, 148, 8876, 90, 120, 70002, 900001, '8480-6', 'mmHg'),
(9000002, 12345, 3012888, '2026-01-13', '2026-01-13 09:15:00', 32817, 92, 8876, 60, 80, 70002, 900001, '8462-4', 'mmHg'),
(9000003, 12345, 3027018, '2026-01-13', '2026-01-13 09:15:00', 32817, 98, 8541, 60, 100, 70002, 900001, '8867-4', '/min'),
(9000004, 12345, 3024171, '2026-01-13', '2026-01-13 09:15:00', 32817, 18, 8483, 12, 20, 70002, 900001, '9279-1', 'breaths/min'),
(9000005, 12345, 3020891, '2026-01-13', '2026-01-13 09:15:00', 32817, 98.4, 586323, 97, 99, 70002, 900001, '8310-5', 'degF'),
(9000006, 12345, 3025315, '2026-01-13', '2026-01-13 09:15:00', 32817, 187, 8739, NULL, NULL, 70002, 900001, '29463-7', 'lbs'),
(9000007, 12345, 3036277, '2026-01-13', '2026-01-13 09:15:00', 32817, 162.56, 8582, NULL, NULL, 70002, 900001, '8302-2', 'cm'),
(9000008, 12345, 3038553, '2026-01-13', '2026-01-13 09:15:00', 32817, 32.1, 9531, 18.5, 24.9, 70002, 900001, '39156-5', 'kg/m2'),
(9000009, 12345, 40762499, '2026-01-13', '2026-01-13 09:15:00', 32817, 97, 8554, 95, 100, 70002, 900001, '2708-6', '%'),
(9000010, 12345, 3004501, '2026-01-13', '2026-01-13 09:15:00', 32817, 218, 8840, 70, 140, 70002, 900001, '2339-0', 'mg/dL'),

-- Lab Results from prior visit (01/10/2026) - Referenced in SOAP note
(9000011, 12345, 3034639, '2026-01-10', '2026-01-10 08:00:00', 32856, 8.2, 8554, 4.0, 5.6, 70001, NULL, '4548-4', '%'),
(9000012, 12345, 3004501, '2026-01-10', '2026-01-10 08:00:00', 32856, 162, 8840, 70, 100, 70001, NULL, '2339-0', 'mg/dL'),
(9000013, 12345, 3016723, '2026-01-10', '2026-01-10 08:00:00', 32856, 0.9, 8840, 0.6, 1.2, 70001, NULL, '2160-0', 'mg/dL'),
(9000014, 12345, 3049187, '2026-01-10', '2026-01-10 08:00:00', 32856, 65, 8647, 60, 120, 70001, NULL, '98979-8', 'mL/min/1.73m2'),

-- Lab Results ordered at PCP visit (resulted 01/16/2026) - Chapter 3
(9000015, 12345, 3019550, '2026-01-16', '2026-01-16 10:00:00', 32856, 1.8, 8837, 0.4, 4.0, 70001, 900001, '3016-3', 'mIU/L'),
(9000016, 12345, 3000963, '2026-01-16', '2026-01-16 10:00:00', 32856, 12.8, 8713, 12.0, 16.0, 70001, 900001, '718-7', 'g/dL'),
(9000017, 12345, 3023314, '2026-01-16', '2026-01-16 10:00:00', 32856, 38.2, 8554, 36, 46, 70001, 900001, '4544-3', '%'),
(9000018, 12345, 3010813, '2026-01-16', '2026-01-16 10:00:00', 32856, 7.2, 8784, 4.5, 11.0, 70001, 900001, '6690-2', '10*3/uL'),
(9000019, 12345, 3024929, '2026-01-16', '2026-01-16 10:00:00', 32856, 245, 8784, 150, 400, 70001, 900001, '777-3', '10*3/uL'),

-- Cardiology Visit Vitals (01/17/2026)
(9000020, 12345, 3004249, '2026-01-17', '2026-01-17 14:15:00', 32817, 142, 8876, 90, 120, 70003, 900002, '8480-6', 'mmHg'),
(9000021, 12345, 3012888, '2026-01-17', '2026-01-17 14:15:00', 32817, 88, 8876, 60, 80, 70003, 900002, '8462-4', 'mmHg'),
(9000022, 12345, 3027018, '2026-01-17', '2026-01-17 14:15:00', 32817, 92, 8541, 60, 100, 70003, 900002, '8867-4', '/min'),

-- Follow-up Visit Vitals (01/27/2026) - Improved with treatment
(9000023, 12345, 3004249, '2026-01-27', '2026-01-27 10:15:00', 32817, 132, 8876, 90, 120, 70002, 900003, '8480-6', 'mmHg'),
(9000024, 12345, 3012888, '2026-01-27', '2026-01-27 10:15:00', 32817, 82, 8876, 60, 80, 70002, 900003, '8462-4', 'mmHg'),
(9000025, 12345, 3027018, '2026-01-27', '2026-01-27 10:15:00', 32817, 72, 8541, 60, 100, 70002, 900003, '8867-4', '/min'),
(9000026, 12345, 3025315, '2026-01-27', '2026-01-27 10:15:00', 32817, 185, 8739, NULL, NULL, 70002, 900003, '29463-7', 'lbs')
ON CONFLICT (measurement_id) DO NOTHING;

-- =============================================================================
-- SECTION 9: DRUG EXPOSURE DATA
-- =============================================================================
-- Maria's medications mapped to RxNorm concepts
-- Drug type: 38000177 = Prescription written
-- Route: 4132161 = Oral
--
-- RxNorm to OMOP concept mappings:
--   1503297 = Metformin 1000 MG Oral Tablet (RxNorm 861007)
--   1308216 = Lisinopril 20 MG Oral Tablet (RxNorm 314076)
--   40228152 = Apixaban 5 MG Oral Tablet (RxNorm 1364435)
--   19078461 = Metoprolol Succinate 25 MG Extended Release Oral Tablet (RxNorm 866924)
--
-- Pre-existing medications (prior to AFib diagnosis)

INSERT INTO cdm.drug_exposure (
    drug_exposure_id,
    person_id,
    drug_concept_id,
    drug_exposure_start_date,
    drug_exposure_start_datetime,
    drug_exposure_end_date,
    drug_type_concept_id,
    stop_reason,
    refills,
    quantity,
    days_supply,
    sig,
    route_concept_id,
    provider_id,
    visit_occurrence_id,
    drug_source_value,
    route_source_value
) VALUES
-- Metformin 1000mg BID - Diabetes management (ongoing from 2023)
(900201, 12345, 1503297, '2023-01-15', '2023-01-15 00:00:00', '2026-12-31',
 38000177, NULL, 11, 60, 30, 'Take 1000 mg by mouth twice daily with meals',
 4132161, 70001, NULL, '861007', 'Oral'),

-- Lisinopril 20mg daily - Hypertension (ongoing from 2021)
(900202, 12345, 1308216, '2021-03-10', '2021-03-10 00:00:00', '2026-12-31',
 38000177, NULL, 11, 30, 30, 'Take 20 mg by mouth once daily',
 4132161, 70001, NULL, '314076', 'Oral'),

-- NEW MEDICATIONS after AFib diagnosis (01/13/2026)

-- Apixaban 5mg BID - Stroke prevention for AFib
(900203, 12345, 40228152, '2026-01-13', '2026-01-13 10:00:00', '2026-12-31',
 38000177, NULL, 5, 60, 30, 'Take 5 mg by mouth twice daily',
 4132161, 70001, 900001, '1364435', 'Oral'),

-- Metoprolol Succinate 25mg daily - Rate control for AFib
(900204, 12345, 19078461, '2026-01-13', '2026-01-13 10:00:00', '2026-12-31',
 38000177, NULL, 5, 30, 30, 'Take 25 mg by mouth once daily',
 4132161, 70001, 900001, '866924', 'Oral')
ON CONFLICT (drug_exposure_id) DO NOTHING;

-- =============================================================================
-- SECTION 10: PROCEDURE OCCURRENCE DATA
-- =============================================================================
-- Procedures performed during Maria's care
-- Procedure type: 32817 = EHR encounter record
--
-- CPT4 to OMOP concept mappings:
--   2211331 = Electrocardiogram, routine ECG (CPT 93000)
--   2211362 = Echocardiography (CPT 93306)
--   2514404 = Office visit, established patient, moderate complexity (CPT 99214)

INSERT INTO cdm.procedure_occurrence (
    procedure_occurrence_id,
    person_id,
    procedure_concept_id,
    procedure_date,
    procedure_datetime,
    procedure_type_concept_id,
    quantity,
    provider_id,
    visit_occurrence_id,
    procedure_source_value
) VALUES
-- EKG at PCP Visit (01/13/2026) - Revealed AFib
(900301, 12345, 2211331, '2026-01-13', '2026-01-13 09:45:00', 32817, 1, 70001, 900001, '93000'),

-- Office Visit E&M - PCP (01/13/2026)
(900302, 12345, 2514404, '2026-01-13', '2026-01-13 09:00:00', 32817, 1, 70001, 900001, '99214'),

-- Echocardiogram at Cardiology (01/17/2026)
(900303, 12345, 2211362, '2026-01-17', '2026-01-17 14:30:00', 32817, 1, 70003, 900002, '93306'),

-- Office Visit E&M - Cardiology (01/17/2026)
(900304, 12345, 2514404, '2026-01-17', '2026-01-17 14:00:00', 32817, 1, 70003, 900002, '99214'),

-- Follow-up visits
(900305, 12345, 2514404, '2026-01-27', '2026-01-27 10:00:00', 32817, 1, 70001, 900003, '99214'),
(900306, 12345, 2514404, '2026-02-14', '2026-02-14 14:00:00', 32817, 1, 70003, 900004, '99214')
ON CONFLICT (procedure_occurrence_id) DO NOTHING;

-- =============================================================================
-- SECTION 11: OBSERVATION DATA
-- =============================================================================
-- Clinical observations, risk scores, and other non-measurement data
-- Observation type: 32817 = EHR encounter record

INSERT INTO cdm.observation (
    observation_id,
    person_id,
    observation_concept_id,
    observation_date,
    observation_datetime,
    observation_type_concept_id,
    value_as_number,
    value_as_string,
    provider_id,
    visit_occurrence_id,
    observation_source_value
) VALUES
-- CHA2DS2-VASc Score = 3 (HTN=1, DM=1, Female=1)
(900401, 12345, 0, '2026-01-13', '2026-01-13 10:00:00', 32817, 3, 'HIGH stroke risk', 70001, 900001, 'CHA2DS2-VASc'),

-- HAS-BLED Score = 1 (HTN=1)
(900402, 12345, 0, '2026-01-13', '2026-01-13 10:00:00', 32817, 1, 'LOW bleeding risk', 70001, 900001, 'HAS-BLED'),

-- Smoking status - Never smoker
(900403, 12345, 4041306, '2026-01-13', '2026-01-13 09:20:00', 32817, NULL, 'Never smoker', 70002, 900001, 'SMOKING_STATUS'),

-- Primary insurance - Medicaid
(900404, 12345, 0, '2026-01-13', '2026-01-13 08:30:00', 32817, NULL, 'Illinois Medicaid', 70002, 900001, 'INSURANCE_TYPE'),

-- Occupation
(900405, 12345, 0, '2026-01-13', '2026-01-13 08:30:00', 32817, NULL, 'Elementary School Teacher', 70002, 900001, 'OCCUPATION'),

-- Echo findings (01/17/2026)
(900406, 12345, 0, '2026-01-17', '2026-01-17 15:00:00', 32817, 55, 'LVEF 55% - Normal', 70003, 900002, 'ECHO_LVEF'),
(900407, 12345, 0, '2026-01-17', '2026-01-17 15:00:00', 32817, 4.2, 'LA mildly dilated', 70003, 900002, 'ECHO_LA_SIZE')
ON CONFLICT (observation_id) DO NOTHING;

-- =============================================================================
-- SECTION 12: PAYER PLAN PERIOD
-- =============================================================================
-- Insurance coverage information

INSERT INTO cdm.payer_plan_period (
    payer_plan_period_id,
    person_id,
    payer_plan_period_start_date,
    payer_plan_period_end_date,
    payer_concept_id,
    payer_source_value,
    plan_source_value
) VALUES
(7001, 12345, '2025-01-01', '2026-12-31', 0, 'Illinois Medicaid', 'IL-MC-001')
ON CONFLICT (payer_plan_period_id) DO NOTHING;

-- =============================================================================
-- VERIFICATION QUERIES
-- =============================================================================
-- Run these queries to verify the data was loaded correctly

-- Count records per table
SELECT 'person' as table_name, COUNT(*) as record_count FROM cdm.person WHERE person_id = 12345
UNION ALL
SELECT 'visit_occurrence', COUNT(*) FROM cdm.visit_occurrence WHERE person_id = 12345
UNION ALL
SELECT 'condition_occurrence', COUNT(*) FROM cdm.condition_occurrence WHERE person_id = 12345
UNION ALL
SELECT 'measurement', COUNT(*) FROM cdm.measurement WHERE person_id = 12345
UNION ALL
SELECT 'drug_exposure', COUNT(*) FROM cdm.drug_exposure WHERE person_id = 12345
UNION ALL
SELECT 'procedure_occurrence', COUNT(*) FROM cdm.procedure_occurrence WHERE person_id = 12345
UNION ALL
SELECT 'observation', COUNT(*) FROM cdm.observation WHERE person_id = 12345
UNION ALL
SELECT 'provider', COUNT(*) FROM cdm.provider WHERE provider_id BETWEEN 70001 AND 70004
UNION ALL
SELECT 'care_site', COUNT(*) FROM cdm.care_site WHERE care_site_id BETWEEN 80001 AND 80002
UNION ALL
SELECT 'location', COUNT(*) FROM cdm.location WHERE location_id BETWEEN 90001 AND 90003;

-- =============================================================================
-- SAMPLE ANALYTICAL QUERIES
-- =============================================================================
-- Example queries demonstrating use of the teaching dataset

-- Query 1: Get Maria's current active medications
/*
SELECT
    p.person_source_value as mrn,
    c.concept_name as medication,
    de.drug_exposure_start_date,
    de.sig as instructions,
    pr.provider_name as prescriber
FROM cdm.drug_exposure de
JOIN cdm.person p ON de.person_id = p.person_id
JOIN vocabulary.concept c ON de.drug_concept_id = c.concept_id
JOIN cdm.provider pr ON de.provider_id = pr.provider_id
WHERE de.person_id = 12345
  AND de.drug_exposure_end_date >= CURRENT_DATE
ORDER BY de.drug_exposure_start_date DESC;
*/

-- Query 2: Get Maria's conditions with ICD-10 codes
/*
SELECT
    c.concept_name as condition,
    sc.concept_code as icd10_code,
    co.condition_start_date,
    pr.provider_name as diagnosing_provider
FROM cdm.condition_occurrence co
JOIN vocabulary.concept c ON co.condition_concept_id = c.concept_id
JOIN vocabulary.concept sc ON co.condition_source_concept_id = sc.concept_id
JOIN cdm.provider pr ON co.provider_id = pr.provider_id
WHERE co.person_id = 12345
ORDER BY co.condition_start_date;
*/

-- Query 3: Get vital signs trend for blood pressure
/*
SELECT
    m.measurement_date,
    MAX(CASE WHEN m.measurement_source_value = '8480-6' THEN m.value_as_number END) as systolic_bp,
    MAX(CASE WHEN m.measurement_source_value = '8462-4' THEN m.value_as_number END) as diastolic_bp
FROM cdm.measurement m
WHERE m.person_id = 12345
  AND m.measurement_source_value IN ('8480-6', '8462-4')
GROUP BY m.measurement_date
ORDER BY m.measurement_date;
*/

-- Query 4: Clinical timeline of all events
/*
SELECT
    'Visit' as event_type,
    v.visit_start_date as event_date,
    cs.care_site_name as location,
    pr.provider_name as provider
FROM cdm.visit_occurrence v
JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
JOIN cdm.provider pr ON v.provider_id = pr.provider_id
WHERE v.person_id = 12345

UNION ALL

SELECT
    'New Diagnosis' as event_type,
    co.condition_start_date,
    c.concept_name,
    NULL
FROM cdm.condition_occurrence co
JOIN vocabulary.concept c ON co.condition_concept_id = c.concept_id
WHERE co.person_id = 12345

UNION ALL

SELECT
    'Medication Started' as event_type,
    de.drug_exposure_start_date,
    c.concept_name,
    NULL
FROM cdm.drug_exposure de
JOIN vocabulary.concept c ON de.drug_concept_id = c.concept_id
WHERE de.person_id = 12345

ORDER BY event_date;
*/

-- =============================================================================
-- END OF SCRIPT
-- =============================================================================
--
-- Data Summary:
--   Patient: Maria Rodriguez (person_id: 12345)
--   Providers: 4 (Dr. Chen, Lisa Brown RN, Dr. Torres, Jessica Martinez PharmD)
--   Care Sites: 2 (Community Health Clinic, Springfield Cardiology Associates)
--   Visits: 4 (2 PCP, 2 Cardiology)
--   Conditions: 4 (T2DM, HTN, Obesity, AFib)
--   Measurements: 26 (Vitals, Labs)
--   Medications: 4 (Metformin, Lisinopril, Apixaban, Metoprolol)
--   Procedures: 6 (EKG, Echo, Office Visits)
--   Observations: 7 (Risk scores, demographics)
--
-- This dataset supports teaching:
--   - Chapter 1: Patient Registration & Demographics
--   - Chapter 2: Clinical Encounter & Documentation
--   - Chapter 3: Diagnostic Workup & Orders
--   - Chapter 4: Specialty Referral & Care Coordination
--   - Chapter 5: Medication Management
--   - Chapter 6: Clinical Decision Support (CHA2DS2-VASc, HAS-BLED)
--   - Chapter 7: Quality Measurement (HEDIS diabetes measures)
--   - Chapter 8: Billing & Coding (ICD-10, CPT)
--
-- =============================================================================
