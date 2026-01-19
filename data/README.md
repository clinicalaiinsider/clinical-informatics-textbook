# Data Files

This directory contains downloadable CSV files representing the Maria Rodriguez teaching dataset in OMOP CDM 5.4 format.

## CSV Files

| File | Records | OMOP Table | Description |
|------|---------|------------|-------------|
| `person.csv` | 1 | PERSON | Patient demographics |
| `location.csv` | 4 | LOCATION | Physical addresses |
| `care_site.csv` | 4 | CARE_SITE | Healthcare facilities |
| `provider.csv` | 4 | PROVIDER | Healthcare providers |
| `visit_occurrence.csv` | 4 | VISIT_OCCURRENCE | Clinical encounters |
| `condition_occurrence.csv` | 4 | CONDITION_OCCURRENCE | Diagnoses |
| `measurement.csv` | 16 | MEASUREMENT | Vitals and lab results |
| `drug_exposure.csv` | 4 | DRUG_EXPOSURE | Medications |
| `procedure_occurrence.csv` | 6 | PROCEDURE_OCCURRENCE | Procedures |
| `observation.csv` | 4 | OBSERVATION | Risk scores, social history |
| `note.csv` | 3 | NOTE | Clinical narratives |
| `data_dictionary.csv` | 35 | - | Column definitions |

## Usage

### Import into PostgreSQL
```sql
-- Create table and import
COPY cdm.person FROM '/path/to/person.csv' WITH CSV HEADER;
```

### Load into Python
```python
import pandas as pd

person_df = pd.read_csv('person.csv')
visits_df = pd.read_csv('visit_occurrence.csv')
```

### Load into R
```r
library(readr)

person <- read_csv("person.csv")
visits <- read_csv("visit_occurrence.csv")
```

## Data Dictionary

See `data_dictionary.csv` for complete column definitions including:
- Column names and data types
- Description of each field
- Example values
- OMOP CDM version reference

## Notes

- All data is synthetic and for educational purposes only
- Concept IDs reference standard OMOP vocabulary tables
- Dates are set in January 2026 for the teaching scenario
- Foreign key relationships are maintained across tables

## Vocabulary Concept IDs Used

### Gender
- 8507 = Male
- 8532 = Female

### Race
- 8527 = White

### Ethnicity
- 38003563 = Hispanic or Latino

### Visit Types
- 9201 = Inpatient
- 9202 = Outpatient
- 9203 = Emergency Room

### Condition Concepts (SNOMED CT)
- 313217 = Atrial fibrillation
- 201826 = Type 2 diabetes mellitus
- 320128 = Essential hypertension
- 433736 = Obesity

### Measurement Concepts (LOINC)
- 3004249 = Systolic blood pressure (8480-6)
- 3012888 = Diastolic blood pressure (8462-4)
- 3004410 = Hemoglobin A1c (4548-4)

### Drug Concepts (RxNorm)
- 1308216 = Lisinopril 10mg
- 1503297 = Metformin 500mg
- 1310149 = Apixaban 5mg
- 1307046 = Metoprolol succinate 25mg

### Procedure Concepts (CPT)
- 2211360 = 99214 Office visit
- 2313891 = 93000 ECG
- 2313897 = 93306 Echocardiogram
