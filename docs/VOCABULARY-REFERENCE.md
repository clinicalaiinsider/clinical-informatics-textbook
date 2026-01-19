---
created: 2026-01-14 20:05:42
profile: research-hub
type: research-document
status: draft
---

# Vocabulary Quick Reference

This document provides a quick reference for the clinical vocabularies used in the Maria Rodriguez teaching dataset.

## Overview

| Vocabulary | Domain | Authority | Example |
|------------|--------|-----------|---------|
| SNOMED CT | Conditions, Findings | SNOMED International | Atrial fibrillation (313217) |
| ICD-10-CM | Diagnosis Codes | CMS/NCHS | I48.91 |
| LOINC | Measurements, Labs | Regenstrief Institute | 8480-6 (Systolic BP) |
| RxNorm | Medications | NLM | Apixaban 5mg (1310149) |
| CPT | Procedures | AMA | 99214 (Office visit) |
| HCPCS | Procedures, Supplies | CMS | E0601 (CPAP device) |

## Conditions (SNOMED CT)

### Conditions in Dataset

| Condition | SNOMED Concept ID | ICD-10-CM | Clinical Context |
|-----------|------------------|-----------|------------------|
| Atrial fibrillation | 313217 | I48.91 | New diagnosis during ED visit |
| Type 2 diabetes mellitus | 201826 | E11.9 | Chronic condition since 2021 |
| Essential hypertension | 320128 | I10 | Chronic condition since 2019 |
| Obesity | 433736 | E66.9 | BMI 32.1 |

### Useful SNOMED Hierarchies

```
Heart disease (56265001)
├── Cardiac arrhythmia (698247007)
│   └── Atrial fibrillation (49436004)
│       └── Unspecified atrial fibrillation (313217)
```

## Measurements (LOINC)

### Vital Signs

| Measurement | LOINC Code | Concept ID | Units |
|-------------|------------|------------|-------|
| Systolic blood pressure | 8480-6 | 3004249 | mmHg |
| Diastolic blood pressure | 8462-4 | 3012888 | mmHg |
| Heart rate | 8867-4 | 3027018 | /min |
| Body temperature | 8310-5 | 3025315 | degF |
| BMI | 39156-5 | 3038553 | kg/m² |

### Laboratory Tests

| Test | LOINC Code | Concept ID | Units | Reference Range |
|------|------------|------------|-------|-----------------|
| Glucose | 2345-7 | 3004501 | mg/dL | 70-100 |
| Hemoglobin A1c | 4548-4 | 3004410 | % | 4.0-5.6 |
| TSH | 3016-3 | 3019550 | mIU/L | 0.4-4.0 |
| eGFR | 33914-3 | 3049187 | mL/min/1.73m² | >90 |
| Hemoglobin | 718-7 | 3000905 | g/dL | 12-16 |
| WBC | 6690-2 | 3010813 | /uL | 4000-11000 |
| Platelet count | 777-3 | 3024929 | /uL | 150000-400000 |

## Medications (RxNorm)

### Active Medications

| Medication | RxNorm Code | Concept ID | Class | Indication |
|------------|-------------|------------|-------|------------|
| Lisinopril 10mg | 314076 | 1308216 | ACE Inhibitor | Hypertension |
| Metformin 500mg | 860975 | 1503297 | Biguanide | Type 2 DM |
| Apixaban 5mg | 1364430 | 1310149 | Factor Xa Inhibitor | AFib/Stroke prevention |
| Metoprolol succinate 25mg | 866924 | 1307046 | Beta blocker | Rate control |

### RxNorm Hierarchy Example

```
Anticoagulant (N0000175565)
├── Factor Xa Inhibitor
│   ├── Apixaban
│   │   └── Apixaban 5mg oral tablet (1364430)
│   ├── Rivaroxaban
│   └── Edoxaban
└── Direct Thrombin Inhibitor
    └── Dabigatran
```

## Procedures (CPT/HCPCS)

### Procedures in Dataset

| Procedure | CPT Code | Concept ID | Description | Typical Charge |
|-----------|----------|------------|-------------|----------------|
| Office visit (Level 4) | 99214 | 2211360 | Established patient, moderate complexity | $150-200 |
| Office visit (Level 3) | 99213 | 2211359 | Established patient, low complexity | $100-150 |
| ECG with interpretation | 93000 | 2313891 | 12-lead electrocardiogram | $50-75 |
| Echocardiogram, complete | 93306 | 2313897 | TTE with Doppler | $300-500 |

## Risk Scores

### CHA₂DS₂-VASc Components

| Factor | Points | OMOP Derivation |
|--------|--------|-----------------|
| Congestive heart failure | 1 | condition_concept_id = 316139 |
| Hypertension | 1 | condition_concept_id = 320128 |
| Age ≥75 | 2 | EXTRACT(YEAR FROM CURRENT_DATE) - year_of_birth >= 75 |
| Diabetes | 1 | condition_concept_id = 201826 |
| Stroke/TIA | 2 | condition_concept_id IN (stroke concepts) |
| Vascular disease | 1 | condition_concept_id IN (vascular concepts) |
| Age 65-74 | 1 | age BETWEEN 65 AND 74 |
| Sex (female) | 1 | gender_concept_id = 8532 |

### Maria's CHA₂DS₂-VASc Calculation

| Factor | Present | Points |
|--------|---------|--------|
| CHF | No | 0 |
| Hypertension | Yes | 1 |
| Age ≥75 | No (47) | 0 |
| Diabetes | Yes | 1 |
| Stroke/TIA | No | 0 |
| Vascular disease | No | 0 |
| Age 65-74 | No | 0 |
| Female | Yes | 1 |
| **Total** | | **3** |

**Interpretation**: Score of 3 = HIGH risk (>3% annual stroke risk)
**Recommendation**: Anticoagulation indicated

## Concept ID Lookup

### Using ATHENA

The official OMOP vocabulary browser: https://athena.ohdsi.org/

### SQL Query for Concept Lookup

```sql
-- Find concept by name
SELECT concept_id, concept_name, vocabulary_id, concept_code
FROM vocabulary.concept
WHERE LOWER(concept_name) LIKE '%atrial fibrillation%'
  AND standard_concept = 'S';

-- Find concept by source code
SELECT concept_id, concept_name, vocabulary_id
FROM vocabulary.concept
WHERE concept_code = 'I48.91';
```

## Common Vocabulary Mappings

### ICD-10-CM to SNOMED CT

| ICD-10-CM | Description | SNOMED CT | Concept ID |
|-----------|-------------|-----------|------------|
| I48.91 | Unspecified atrial fibrillation | Atrial fibrillation | 313217 |
| E11.9 | Type 2 DM without complications | Type 2 diabetes mellitus | 201826 |
| I10 | Essential hypertension | Essential hypertension | 320128 |
| E66.9 | Obesity, unspecified | Obesity | 433736 |

### Unit Concept IDs

| Unit | Concept ID |
|------|------------|
| mmHg | 8876 |
| /min (bpm) | 8541 |
| mg/dL | 8840 |
| % | 8554 |
| kg/m² | 9531 |
| g/dL | 8713 |
| mIU/L | 8749 |
| mL/min/1.73m² | 8753 |
| degF | 9289 |

## Additional Resources

- [ATHENA Vocabulary Browser](https://athena.ohdsi.org/)
- [SNOMED CT Browser](https://browser.ihtsdotools.org/)
- [LOINC Search](https://loinc.org/search/)
- [RxNav (RxNorm)](https://mor.nlm.nih.gov/RxNav/)
- [OMOP CDM Vocabulary Documentation](https://ohdsi.github.io/CommonDataModel/cdm54.html#vocabulary-tables)
