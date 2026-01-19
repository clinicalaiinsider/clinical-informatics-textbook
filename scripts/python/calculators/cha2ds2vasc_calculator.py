#!/usr/bin/env python3
# ============================================================================
# Script: cha2ds2vasc_calculator.py
# Chapter: 6 - Clinical Decision Support
# Textbook Section: 6.2 Risk Scores Implementation
#
# Description:
#   CHA2DS2-VASc Stroke Risk Calculator for clinical decision support
#   in atrial fibrillation management. Calculates stroke risk based on
#   patient demographics and comorbidities.
#
# Prerequisites:
#   - Python 3.8+
#   - No external dependencies (uses standard library only)
#
# Usage:
#   python cha2ds2vasc_calculator.py
#
# Expected Results:
#   For Maria Rodriguez (47F with HTN, DM):
#   - CHA2DS2-VASc Score: 3
#   - Annual Stroke Risk: 3.2%
#   - Recommendation: Oral anticoagulation strongly recommended
# ============================================================================

"""
CHA2DS2-VASc Stroke Risk Calculator
Clinical decision support for atrial fibrillation management
"""

from dataclasses import dataclass
from datetime import date
from typing import List, Optional


@dataclass
class PatientContext:
    """Patient data needed for risk calculation."""
    birth_date: date
    gender: str  # 'male' or 'female'
    conditions: List[str]  # ICD-10 codes
    has_chf: bool = False
    has_hypertension: bool = False
    has_diabetes: bool = False
    has_stroke_tia: bool = False
    has_vascular_disease: bool = False


@dataclass
class RiskScore:
    """Risk calculation result."""
    score: int
    annual_stroke_risk: float
    recommendation: str
    factors: dict


def calculate_age(birth_date: date, reference_date: date = None) -> int:
    """Calculate age in years."""
    if reference_date is None:
        reference_date = date.today()

    age = reference_date.year - birth_date.year
    if (reference_date.month, reference_date.day) < (birth_date.month, birth_date.day):
        age -= 1
    return age


def calculate_cha2ds2_vasc(context: PatientContext) -> RiskScore:
    """
    Calculate CHA2DS2-VASc score for stroke risk in atrial fibrillation.

    Scoring:
    - C: Congestive heart failure (+1)
    - H: Hypertension (+1)
    - A2: Age ≥75 (+2)
    - D: Diabetes (+1)
    - S2: Stroke/TIA/thromboembolism (+2)
    - V: Vascular disease (+1)
    - A: Age 65-74 (+1)
    - Sc: Sex category - female (+1)
    """
    score = 0
    factors = {}

    # C: Congestive heart failure
    if context.has_chf or any(code.startswith('I50') for code in context.conditions):
        score += 1
        factors['CHF'] = 1

    # H: Hypertension
    if context.has_hypertension or 'I10' in context.conditions:
        score += 1
        factors['Hypertension'] = 1

    # A2: Age ≥75
    age = calculate_age(context.birth_date)
    if age >= 75:
        score += 2
        factors['Age ≥75'] = 2
    # A: Age 65-74
    elif age >= 65:
        score += 1
        factors['Age 65-74'] = 1

    # D: Diabetes
    if context.has_diabetes or any(code.startswith('E11') for code in context.conditions):
        score += 1
        factors['Diabetes'] = 1

    # S2: Stroke/TIA/thromboembolism
    stroke_codes = ['I63', 'I64', 'G45', 'I74']
    if context.has_stroke_tia or any(
        any(code.startswith(sc) for sc in stroke_codes)
        for code in context.conditions
    ):
        score += 2
        factors['Stroke/TIA'] = 2

    # V: Vascular disease
    vascular_codes = ['I25', 'I70', 'I71']  # CAD, PAD, aortic disease
    if context.has_vascular_disease or any(
        any(code.startswith(vc) for vc in vascular_codes)
        for code in context.conditions
    ):
        score += 1
        factors['Vascular disease'] = 1

    # Sc: Sex category (female)
    if context.gender.lower() == 'female':
        score += 1
        factors['Female sex'] = 1

    # Calculate annual stroke risk based on score
    risk_table = {
        0: 0.2,
        1: 0.6,
        2: 2.2,
        3: 3.2,
        4: 4.8,
        5: 7.2,
        6: 9.7,
        7: 11.2,
        8: 10.8,
        9: 12.2
    }
    annual_risk = risk_table.get(min(score, 9), 12.2)

    # Determine recommendation
    if context.gender.lower() == 'female':
        # For females, anticoagulation recommended if score ≥2
        if score >= 2:
            recommendation = "Oral anticoagulation strongly recommended"
        elif score == 1:
            recommendation = "Anticoagulation should be considered"
        else:
            recommendation = "No anticoagulation indicated"
    else:
        # For males, anticoagulation recommended if score ≥1
        if score >= 1:
            recommendation = "Oral anticoagulation recommended"
        else:
            recommendation = "No anticoagulation indicated"

    return RiskScore(
        score=score,
        annual_stroke_risk=annual_risk,
        recommendation=recommendation,
        factors=factors
    )


if __name__ == "__main__":
    # Calculate Maria Rodriguez's CHA2DS2-VASc score
    maria = PatientContext(
        birth_date=date(1979, 3, 15),
        gender='female',
        conditions=['I48.91', 'I10', 'E11.9', 'E66.9'],
        has_hypertension=True,
        has_diabetes=True
    )

    result = calculate_cha2ds2_vasc(maria)

    print("=" * 60)
    print("CHA2DS2-VASc Risk Calculator - Maria Rodriguez")
    print("=" * 60)
    print(f"CHA2DS2-VASc Score: {result.score}")
    print(f"Annual Stroke Risk: {result.annual_stroke_risk}%")
    print(f"Recommendation: {result.recommendation}")
    print(f"Contributing Factors: {result.factors}")
    print("=" * 60)

    # Expected output:
    # CHA2DS2-VASc Score: 3
    # Annual Stroke Risk: 3.2%
    # Recommendation: Oral anticoagulation strongly recommended
    # Factors: {'Hypertension': 1, 'Diabetes': 1, 'Female sex': 1}
