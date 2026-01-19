---
created: 2026-01-14 20:05:05
profile: research-hub
type: research-document
status: draft
---

# Quick Start Guide

Get up and running with the Clinical Informatics Textbook in 10 minutes.

## Prerequisites

- PostgreSQL 15+ installed
- Basic SQL knowledge
- Terminal/command line access

## Option 1: Using OHDSI-in-a-Box (Recommended)

If you have OHDSI-in-a-Box already set up:

```bash
# Connect to your OHDSI database
psql -U postgres -d ohdsi

# Create learning database
CREATE DATABASE ohdsi_learning;

# Switch to the new database
\c ohdsi_learning

# Load the teaching dataset
\i /path/to/scripts/sql/maria_rodriguez_teaching_dataset.sql
```

## Option 2: Standalone PostgreSQL

```bash
# Create database
createdb ohdsi_learning

# Create schemas (if not using full OMOP setup)
psql -d ohdsi_learning -c "CREATE SCHEMA IF NOT EXISTS cdm;"
psql -d ohdsi_learning -c "CREATE SCHEMA IF NOT EXISTS vocabulary;"

# Load the dataset
psql -d ohdsi_learning -f scripts/sql/maria_rodriguez_teaching_dataset.sql
```

## Verify Installation

Run a quick test query:

```sql
-- Connect to database
psql -d ohdsi_learning

-- Check patient loaded
SELECT person_id, person_source_value, year_of_birth
FROM cdm.person;

-- Expected result:
-- person_id | person_source_value | year_of_birth
-- ----------+--------------------+--------------
--     12345 | MRN-2024-78432     |         1979
```

## Run Example Queries

```bash
# Run all 22 textbook queries
psql -d ohdsi_learning -f scripts/sql/textbook_example_queries.sql
```

## Read the Textbook

Open `docs/CLINICAL-INFORMATICS-TEXTBOOK-ACADEMIC.md` in your preferred markdown viewer or editor.

The textbook is organized into 8 chapters:
1. Patient Registration
2. Clinical Encounter
3. Diagnostic Workup
4. AFib Diagnosis
5. Medication Management
6. Clinical Decision Support
7. Quality Measures
8. Billing & Coding

## Next Steps

1. **Explore the Data**: Browse the CSV files in `data/csv/`
2. **Modify Queries**: Try changing the example queries
3. **Add Patients**: Extend the dataset with additional cases
4. **Learn More**: Check the OHDSI resources in the README

## Troubleshooting

### Database Connection Issues
```bash
# Check PostgreSQL is running
pg_isready

# Check database exists
psql -l | grep ohdsi_learning
```

### Schema Not Found
```bash
# Ensure schemas exist
psql -d ohdsi_learning -c "\dn"
```

### Permission Issues
```bash
# Grant permissions if needed
psql -d ohdsi_learning -c "GRANT ALL ON SCHEMA cdm TO your_user;"
```

## Getting Help

- Open an issue on GitHub
- Check OHDSI Forums: https://forums.ohdsi.org/
- Review OMOP CDM documentation: https://ohdsi.github.io/CommonDataModel/
