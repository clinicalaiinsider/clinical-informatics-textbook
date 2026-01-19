# Clinical Informatics Textbook - Scripts & Code Examples

This directory contains all executable SQL queries and Python scripts referenced in the Clinical Informatics Textbook. The scripts are organized by functional domain to support hands-on learning with the OMOP Common Data Model.

---

## Quick Start

### Prerequisites

1. **PostgreSQL 14+** - See [postgres_installation.md](postgres_installation.md)
2. **Python 3.9+** - For Python scripts
3. **OMOP CDM Database** - See [data_setup.md](data_setup.md)

### Setup Steps

```bash
# 1. Create the database
createdb ohdsi_learning

# 2. Load the teaching dataset
psql -d ohdsi_learning -f sql/01_data_setup/maria_rodriguez_teaching_dataset.sql

# 3. Install Python dependencies
pip install -r python/requirements.txt

# 4. Verify setup
python python/utilities/validate_data.py
```

---

## Directory Structure

```
scripts/
├── README.md                          # This file
├── postgres_installation.md           # PostgreSQL setup guide
├── data_setup.md                      # OMOP data loading guide
│
├── sql/                               # SQL Scripts (by domain)
│   ├── 01_data_setup/                 # Database initialization
│   ├── 02_patient_registration/       # Patient demographics & registration
│   ├── 03_clinical_encounters/        # Visits, conditions, measurements
│   ├── 04_diagnostics/                # Laboratory results & LOINC
│   ├── 05_medications/                # Drug exposures & RxNorm
│   ├── 06_clinical_decision_support/  # Risk scores & CDS alerts
│   ├── 07_quality_measures/           # HEDIS & population health
│   ├── 08_billing/                    # CPT, claims, revenue cycle
│   └── 09_research/                   # Cohort definitions & PLP
│
├── python/                            # Python Scripts (by purpose)
│   ├── services/                      # FHIR & API services
│   ├── calculators/                   # Clinical calculators
│   ├── ml_models/                     # Machine learning models
│   ├── utilities/                     # Data validation & helpers
│   └── requirements.txt               # Python dependencies
│
└── chapters/                          # [Legacy] Chapter-based organization
```

---

## SQL Scripts Index

### 01_data_setup/ - Database Initialization

| File | Description | Chapter |
|------|-------------|---------|
| `maria_rodriguez_teaching_dataset.sql` | Complete teaching dataset with Maria Rodriguez case study | All |
| `textbook_example_queries.sql` | All example queries from the textbook | All |

### 02_patient_registration/ - Patient Demographics

| File | Description | Chapter |
|------|-------------|---------|
| `01_new_patient_registrations.sql` | Insert new patient into PERSON table | Ch. 1 |
| `02_patient_demographics.sql` | Query patient demographic information | Ch. 1 |

### 03_clinical_encounters/ - Visits & Documentation

| File | Description | Chapter |
|------|-------------|---------|
| `01_insert_visit_occurrence.sql` | Create visit/encounter records | Ch. 2 |
| `02_insert_condition_occurrence.sql` | Record diagnoses with ICD-10/SNOMED | Ch. 2 |
| `03_insert_measurements.sql` | Insert vital signs with LOINC codes | Ch. 2 |
| `04_query_vital_signs.sql` | Retrieve and analyze vital sign trends | Ch. 2 |
| `05_query_conditions.sql` | Query active conditions and history | Ch. 2 |
| `06_new_onset_afib_phenotype.sql` | Phenotype definition for new-onset AFib | Ch. 2 |

### 04_diagnostics/ - Laboratory & Imaging

| File | Description | Chapter |
|------|-------------|---------|
| `01_insert_lab_measurements.sql` | Insert lab results with LOINC codes | Ch. 3 |
| `02_query_lab_results.sql` | Query lab panels and interpret results | Ch. 3 |

### 05_medications/ - Pharmacy & Drug Exposure

| File | Description | Chapter |
|------|-------------|---------|
| `01_insert_drug_exposure.sql` | Record medication orders with RxNorm | Ch. 5 |
| `02_query_medications.sql` | Query active medications and history | Ch. 5 |

### 06_clinical_decision_support/ - Risk Stratification

| File | Description | Chapter |
|------|-------------|---------|
| `01_query_risk_scores.sql` | Retrieve calculated risk scores | Ch. 6 |
| `02_calculate_cha2ds2vasc.sql` | SQL-based CHA₂DS₂-VASc calculation | Ch. 6 |

### 07_quality_measures/ - Population Health

| File | Description | Chapter |
|------|-------------|---------|
| `01_hedis_quality_gaps.sql` | HEDIS measure compliance analysis | Ch. 7 |
| `02_bp_control_trends.sql` | Blood pressure control trending | Ch. 7 |
| `03_visit_summary_report.sql` | Visit volume and utilization report | Ch. 7 |
| `04_provider_panel_analysis.sql` | Provider panel management metrics | Ch. 7 |

### 08_billing/ - Revenue Cycle

| File | Description | Chapter |
|------|-------------|---------|
| `01_query_provider_info.sql` | Provider NPI and specialty lookup | Ch. 8 |
| `02_billable_procedures.sql` | CPT code assignment and billing | Ch. 8 |

### 09_research/ - Clinical Research

| File | Description | Chapter |
|------|-------------|---------|
| `01_afib_research_cohort.sql` | AFib cohort definition for research | Ch. 10 |

---

## Python Scripts Index

### services/ - API & Integration Services

| File | Description | Chapter |
|------|-------------|---------|
| `patient_registration_service.py` | FHIR-based patient registration API | Ch. 1 |

### calculators/ - Clinical Calculators

| File | Description | Chapter |
|------|-------------|---------|
| `cha2ds2vasc_calculator.py` | CHA₂DS₂-VASc stroke risk calculator | Ch. 6 |

### ml_models/ - Machine Learning

| File | Description | Chapter |
|------|-------------|---------|
| `readmission_prediction.py` | 30-day readmission prediction model | Ch. 10 |

### utilities/ - Helper Scripts

| File | Description | Chapter |
|------|-------------|---------|
| `validate_data.py` | Validate OMOP CDM data quality | Setup |

---

## Running the Scripts

### SQL Scripts

```bash
# Run a single script
psql -d ohdsi_learning -f sql/03_clinical_encounters/01_insert_visit_occurrence.sql

# Run interactively
psql -d ohdsi_learning
\i sql/03_clinical_encounters/01_insert_visit_occurrence.sql
```

### Python Scripts

```bash
# Run FHIR patient registration service
python python/services/patient_registration_service.py

# Calculate CHA₂DS₂-VASc score
python python/calculators/cha2ds2vasc_calculator.py

# Run readmission prediction model
python python/ml_models/readmission_prediction.py
```

---

## Script Execution Order

For a complete walkthrough following Maria Rodriguez's clinical journey:

1. **Setup**
   ```bash
   psql -d ohdsi_learning -f sql/01_data_setup/maria_rodriguez_teaching_dataset.sql
   ```

2. **Patient Registration** (Chapter 1)
   ```bash
   psql -d ohdsi_learning -f sql/02_patient_registration/01_new_patient_registrations.sql
   psql -d ohdsi_learning -f sql/02_patient_registration/02_patient_demographics.sql
   ```

3. **Clinical Encounter** (Chapter 2)
   ```bash
   psql -d ohdsi_learning -f sql/03_clinical_encounters/01_insert_visit_occurrence.sql
   psql -d ohdsi_learning -f sql/03_clinical_encounters/02_insert_condition_occurrence.sql
   psql -d ohdsi_learning -f sql/03_clinical_encounters/03_insert_measurements.sql
   ```

4. **Diagnostics** (Chapter 3)
   ```bash
   psql -d ohdsi_learning -f sql/04_diagnostics/01_insert_lab_measurements.sql
   psql -d ohdsi_learning -f sql/04_diagnostics/02_query_lab_results.sql
   ```

5. **Medications** (Chapter 5)
   ```bash
   psql -d ohdsi_learning -f sql/05_medications/01_insert_drug_exposure.sql
   psql -d ohdsi_learning -f sql/05_medications/02_query_medications.sql
   ```

6. **Clinical Decision Support** (Chapter 6)
   ```bash
   psql -d ohdsi_learning -f sql/06_clinical_decision_support/02_calculate_cha2ds2vasc.sql
   python python/calculators/cha2ds2vasc_calculator.py
   ```

7. **Quality Measures** (Chapter 7)
   ```bash
   psql -d ohdsi_learning -f sql/07_quality_measures/01_hedis_quality_gaps.sql
   ```

8. **Billing** (Chapter 8)
   ```bash
   psql -d ohdsi_learning -f sql/08_billing/02_billable_procedures.sql
   ```

9. **Research** (Chapter 10)
   ```bash
   psql -d ohdsi_learning -f sql/09_research/01_afib_research_cohort.sql
   python python/ml_models/readmission_prediction.py
   ```

---

## Textbook Cross-Reference

| Chapter | Topic | SQL Scripts | Python Scripts |
|---------|-------|-------------|----------------|
| Ch. 1 | Patient Registration | 2 | 1 |
| Ch. 2 | Clinical Encounter | 6 | 0 |
| Ch. 3 | Diagnostics | 2 | 0 |
| Ch. 5 | Medications | 2 | 0 |
| Ch. 6 | Clinical Decision Support | 2 | 1 |
| Ch. 7 | Quality Measures | 4 | 0 |
| Ch. 8 | Billing | 2 | 0 |
| Ch. 10 | Research | 1 | 1 |
| **Total** | | **21** | **3** |

---

## Related Resources

- **Textbook**: [CLINICAL-INFORMATICS-TEXTBOOK-ACADEMIC.md](../docs/CLINICAL-INFORMATICS-TEXTBOOK-ACADEMIC.md)
- **PostgreSQL Setup**: [postgres_installation.md](postgres_installation.md)
- **Data Setup**: [data_setup.md](data_setup.md)
- **OHDSI Documentation**: https://ohdsi.github.io/TheBookOfOhdsi/

---

## License

Educational use only. See textbook copyright notice for details.
