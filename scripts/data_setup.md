# Data Setup Guide for OMOP Teaching Dataset

This guide walks you through loading the Maria Rodriguez teaching dataset into your PostgreSQL database and verifying the installation.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quick Setup (5 Minutes)](#quick-setup-5-minutes)
3. [Detailed Setup Steps](#detailed-setup-steps)
4. [Data Verification](#data-verification)
5. [Understanding the Data Model](#understanding-the-data-model)
6. [Running Example Queries](#running-example-queries)
7. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before proceeding, ensure you have:

- [x] PostgreSQL 13+ installed (see [postgres_installation.md](postgres_installation.md))
- [x] `ohdsi_learning` database created
- [x] Terminal/Command line access
- [x] Access to this repository's `scripts/sql/` folder

---

## Quick Setup (5 Minutes)

For experienced users, here's the fastest path to getting started:

```bash
# Navigate to the repository root
cd /path/to/CLINICAL-INFORMATICS-TEXTBOOK

# Create database and schemas (skip if already done)
createdb ohdsi_learning 2>/dev/null || echo "Database exists"
psql -d ohdsi_learning -c "CREATE SCHEMA IF NOT EXISTS cdm; CREATE SCHEMA IF NOT EXISTS vocabulary;"

# Load the teaching dataset
psql -d ohdsi_learning -f scripts/sql/maria_rodriguez_teaching_dataset.sql

# Verify the data loaded correctly
psql -d ohdsi_learning -c "SELECT person_id, person_source_value FROM cdm.person;"

# Run all example queries
psql -d ohdsi_learning -f scripts/sql/textbook_example_queries.sql
```

---

## Detailed Setup Steps

### Step 1: Create the Database

If you haven't already created the database:

```bash
createdb ohdsi_learning
```

### Step 2: Create OMOP CDM Schemas

Connect to the database and create the required schemas:

```bash
psql -d ohdsi_learning
```

```sql
-- Create CDM schema for clinical data
CREATE SCHEMA IF NOT EXISTS cdm;

-- Create vocabulary schema for terminologies
CREATE SCHEMA IF NOT EXISTS vocabulary;

-- Create results schema for analysis outputs (optional)
CREATE SCHEMA IF NOT EXISTS results;

-- Set default search path
ALTER DATABASE ohdsi_learning SET search_path TO cdm, vocabulary, results, public;

-- Verify schemas created
\dn
```

Exit psql:
```sql
\q
```

### Step 3: Load the Teaching Dataset

The teaching dataset includes:
- 1 patient (Maria Rodriguez)
- 4 locations
- 4 care sites
- 4 providers
- 4 visits
- 4 conditions
- 16 measurements (vitals + labs)
- 4 drug exposures
- 6 procedures
- 4 observations
- 3 clinical notes

Load the dataset:

```bash
psql -d ohdsi_learning -f scripts/sql/maria_rodriguez_teaching_dataset.sql
```

Expected output:
```
CREATE TABLE
CREATE TABLE
...
INSERT 0 1
INSERT 0 4
...
COMMENT
Teaching dataset loaded successfully!
```

### Step 4: Verify Data Loaded

Run verification queries:

```bash
# Check person table
psql -d ohdsi_learning -c "SELECT person_id, person_source_value, year_of_birth, gender_concept_id FROM cdm.person;"
```

Expected output:
```
 person_id | person_source_value | year_of_birth | gender_concept_id
-----------+--------------------+---------------+-------------------
     12345 | MRN-2024-78432     |          1979 |              8532
```

```bash
# Check visit count
psql -d ohdsi_learning -c "SELECT COUNT(*) as visits FROM cdm.visit_occurrence;"
```

Expected output:
```
 visits
--------
      4
```

```bash
# Check all tables have data
psql -d ohdsi_learning -c "
SELECT
    'person' as table_name, COUNT(*) as records FROM cdm.person
UNION ALL
SELECT 'visit_occurrence', COUNT(*) FROM cdm.visit_occurrence
UNION ALL
SELECT 'condition_occurrence', COUNT(*) FROM cdm.condition_occurrence
UNION ALL
SELECT 'measurement', COUNT(*) FROM cdm.measurement
UNION ALL
SELECT 'drug_exposure', COUNT(*) FROM cdm.drug_exposure
UNION ALL
SELECT 'procedure_occurrence', COUNT(*) FROM cdm.procedure_occurrence
ORDER BY table_name;
"
```

Expected output:
```
      table_name       | records
-----------------------+---------
 condition_occurrence  |       4
 drug_exposure         |       4
 measurement           |      16
 person                |       1
 procedure_occurrence  |       6
 visit_occurrence      |       4
```

---

## Understanding the Data Model

### OMOP CDM 5.4 Tables Used

```
┌─────────────────────────────────────────────────────────────┐
│                     CLINICAL DATA                            │
├─────────────────────────────────────────────────────────────┤
│  PERSON ─────────► VISIT_OCCURRENCE ─────► CONDITION        │
│    │                     │                 OCCURRENCE        │
│    │                     │                                   │
│    │                     ├─────────────────► MEASUREMENT     │
│    │                     │                                   │
│    │                     ├─────────────────► DRUG_EXPOSURE   │
│    │                     │                                   │
│    │                     └─────────────────► PROCEDURE       │
│    │                                         OCCURRENCE       │
│    │                                                         │
│    └───────────────────────────────────────► OBSERVATION     │
├─────────────────────────────────────────────────────────────┤
│                     HEALTH SYSTEM                            │
├─────────────────────────────────────────────────────────────┤
│  LOCATION ─────────► CARE_SITE ─────────► PROVIDER          │
├─────────────────────────────────────────────────────────────┤
│                     CLINICAL NOTES                           │
├─────────────────────────────────────────────────────────────┤
│  NOTE (Linked to PERSON and VISIT_OCCURRENCE)               │
└─────────────────────────────────────────────────────────────┘
```

### Key Concept IDs Used

| Domain | Concept ID | Description |
|--------|------------|-------------|
| **Gender** | 8532 | Female |
| **Visit Types** | 9201 | Inpatient Visit |
| | 9202 | Outpatient Visit |
| | 9203 | Emergency Room Visit |
| **Conditions** | 313217 | Atrial Fibrillation |
| | 201826 | Type 2 Diabetes Mellitus |
| | 320128 | Essential Hypertension |
| | 433736 | Obesity |
| **Measurements** | 3004249 | Systolic Blood Pressure |
| | 3012888 | Diastolic Blood Pressure |
| | 3004410 | Hemoglobin A1c |
| **Medications** | 1308216 | Lisinopril 10mg |
| | 1503297 | Metformin 500mg |
| | 1310149 | Apixaban 5mg |
| | 1307046 | Metoprolol Succinate 25mg |

---

## Running Example Queries

### Run All Textbook Queries

The repository includes 22 example queries from the textbook:

```bash
psql -d ohdsi_learning -f scripts/sql/textbook_example_queries.sql
```

### Run Chapter-Specific Scripts

Scripts are organized by chapter in `scripts/chapters/`:

```bash
# Chapter 1: Patient Registration
psql -d ohdsi_learning -f scripts/chapters/ch01/01_patient_registration.sql

# Chapter 2: Clinical Encounter
psql -d ohdsi_learning -f scripts/chapters/ch02/01_insert_visit_occurrence.sql

# Chapter 6: Clinical Decision Support
psql -d ohdsi_learning -f scripts/chapters/ch06/01_cds_afib_anticoagulation.sql

# Chapter 7: Quality Measures
psql -d ohdsi_learning -f scripts/chapters/ch07/01_hedis_quality_gaps.sql
```

### Interactive SQL Session

For exploratory analysis:

```bash
psql -d ohdsi_learning
```

Then run queries interactively:

```sql
-- View Maria's conditions
SELECT
    co.condition_start_date,
    co.condition_concept_id,
    co.condition_source_value
FROM cdm.condition_occurrence co
WHERE co.person_id = 12345
ORDER BY co.condition_start_date;

-- View Maria's medications
SELECT
    de.drug_exposure_start_date,
    de.drug_concept_id,
    de.drug_source_value
FROM cdm.drug_exposure de
WHERE de.person_id = 12345
ORDER BY de.drug_exposure_start_date;
```

---

## Alternative: Load from CSV Files

If you prefer loading data from CSV files:

```bash
# Navigate to the data directory
cd /path/to/CLINICAL-INFORMATICS-TEXTBOOK/data/csv

# Load each table
psql -d ohdsi_learning -c "\COPY cdm.person FROM 'person.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.location FROM 'location.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.care_site FROM 'care_site.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.provider FROM 'provider.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.visit_occurrence FROM 'visit_occurrence.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.condition_occurrence FROM 'condition_occurrence.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.measurement FROM 'measurement.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.drug_exposure FROM 'drug_exposure.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.procedure_occurrence FROM 'procedure_occurrence.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.observation FROM 'observation.csv' WITH CSV HEADER;"
psql -d ohdsi_learning -c "\COPY cdm.note FROM 'note.csv' WITH CSV HEADER;"
```

---

## Troubleshooting

### "Relation does not exist"

**Cause:** Tables haven't been created yet.

**Solution:** Run the teaching dataset script first:
```bash
psql -d ohdsi_learning -f scripts/sql/maria_rodriguez_teaching_dataset.sql
```

### "Schema does not exist"

**Cause:** Schemas weren't created.

**Solution:**
```bash
psql -d ohdsi_learning -c "CREATE SCHEMA IF NOT EXISTS cdm; CREATE SCHEMA IF NOT EXISTS vocabulary;"
```

### "Permission denied"

**Cause:** Your user doesn't own the schema.

**Solution:**
```bash
psql -d ohdsi_learning -c "GRANT ALL ON SCHEMA cdm TO your_username;"
psql -d ohdsi_learning -c "GRANT ALL ON ALL TABLES IN SCHEMA cdm TO your_username;"
```

### "Duplicate key value violates unique constraint"

**Cause:** Data has already been loaded.

**Solution:** Drop and recreate tables:
```bash
psql -d ohdsi_learning -c "DROP SCHEMA cdm CASCADE; CREATE SCHEMA cdm;"
psql -d ohdsi_learning -f scripts/sql/maria_rodriguez_teaching_dataset.sql
```

### Data Validation Failed

Run the Python validation script:
```bash
cd /path/to/CLINICAL-INFORMATICS-TEXTBOOK
python scripts/python/validate_data.py
```

---

## Next Steps

Once the data is loaded:

1. **Read the Textbook:** Open `docs/CLINICAL-INFORMATICS-TEXTBOOK-ACADEMIC.md`
2. **Run Chapter Scripts:** Explore `scripts/chapters/` by chapter
3. **Experiment:** Modify queries to explore the data
4. **Learn OMOP:** Visit [OHDSI.org](https://ohdsi.org) for more resources

---

## Data Summary

| Table | Records | Description |
|-------|---------|-------------|
| person | 1 | Maria Rodriguez (46F) |
| location | 4 | Physical addresses |
| care_site | 4 | Healthcare facilities |
| provider | 4 | Clinical staff |
| visit_occurrence | 4 | ED visit, outpatient visits, hospitalization |
| condition_occurrence | 4 | AFib, T2DM, HTN, Obesity |
| measurement | 16 | Vitals and lab results |
| drug_exposure | 4 | Lisinopril, Metformin, Apixaban, Metoprolol |
| procedure_occurrence | 6 | EKG, Echo, Office visits |
| observation | 4 | Risk scores, social history |
| note | 3 | Clinical narratives |

---

*Part of the Clinical Informatics Textbook - Teaching Dataset for OMOP CDM 5.4*
