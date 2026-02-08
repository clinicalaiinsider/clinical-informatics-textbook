# Clinical Informatics Textbook: An OMOP CDM Learning Journey

[![OMOP CDM](https://img.shields.io/badge/OMOP%20CDM-5.4-blue)](https://ohdsi.github.io/CommonDataModel/)
[![OHDSI](https://img.shields.io/badge/OHDSI-Network-orange)](https://www.ohdsi.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15+-336791)](https://www.postgresql.org/)

> A comprehensive clinical informatics textbook that teaches OMOP Common Data Model through a realistic patient case study, complete with executable SQL queries and downloadable datasets.

## Overview

This repository contains an interactive clinical informatics textbook designed to teach healthcare data standardization using the OHDSI OMOP Common Data Model. The textbook follows **Maria Rodriguez**, a 47-year-old patient, through her complete clinical journey from registration to billing, demonstrating how real-world clinical data maps to OMOP CDM 5.4.

### What You'll Learn

- **Clinical Workflows**: Patient registration, encounters, diagnostics, medication management, clinical decision support
- **Data Standards**: ICD-10-CM, SNOMED CT, LOINC, RxNorm, CPT/HCPCS vocabulary mapping
- **OMOP CDM**: Complete understanding of CDM tables, relationships, and query patterns
- **Practical SQL**: 22 executable queries demonstrating real clinical data analysis

## Quick Start

### Prerequisites

- PostgreSQL 15+ with OMOP CDM schema
- Basic SQL knowledge
- Understanding of clinical workflows (helpful but not required)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/clinical-informatics-textbook.git
   cd clinical-informatics-textbook
   ```

2. **Set up your database** (if using OHDSI-in-a-Box or similar)
   ```bash
   # Create the ohdsi_learning database
   psql -U postgres -c "CREATE DATABASE ohdsi_learning;"
   ```

3. **Load the teaching dataset**
   ```bash
   psql -U postgres -d ohdsi_learning -f scripts/sql/maria_rodriguez_teaching_dataset.sql
   ```

4. **Run example queries**
   ```bash
   psql -U postgres -d ohdsi_learning -f scripts/sql/textbook_example_queries.sql
   ```

## Repository Structure

```
clinical-informatics-textbook/
├── README.md                           # This file
├── LICENSE                             # MIT License
├── CONTRIBUTING.md                     # Contribution guidelines
│
├── docs/
│   └── CLINICAL-INFORMATICS-TEXTBOOK-ACADEMIC.md   # Full textbook
│
├── scripts/
│   ├── sql/
│   │   ├── README.md                   # SQL scripts documentation
│   │   ├── maria_rodriguez_teaching_dataset.sql    # Complete dataset loader
│   │   └── textbook_example_queries.sql            # 22 learning queries
│   └── python/
│       └── (future: data validation scripts)
│
├── data/
│   ├── csv/
│   │   ├── person.csv                  # Patient demographics
│   │   ├── location.csv                # Address/location data
│   │   ├── care_site.csv               # Healthcare facilities
│   │   ├── provider.csv                # Healthcare providers
│   │   ├── visit_occurrence.csv        # Clinical encounters
│   │   ├── condition_occurrence.csv    # Diagnoses (ICD-10 → SNOMED)
│   │   ├── measurement.csv             # Vitals, labs (LOINC)
│   │   ├── drug_exposure.csv           # Medications (RxNorm)
│   │   ├── procedure_occurrence.csv    # Procedures (CPT)
│   │   ├── observation.csv             # Risk scores, social history
│   │   ├── note.csv                    # Clinical notes
│   │   └── data_dictionary.csv         # Column definitions
│   └── sample-queries/
│       └── (query result examples)
│
├── tests/
│   └── (future: data quality tests)
│
└── assets/
    ├── diagrams/
    │   └── (CDM relationship diagrams)
    └── screenshots/
        └── (query result screenshots)
```

## The Patient Case Study

The textbook follows Maria Rodriguez through her clinical journey:

| Chapter | Clinical Event | OMOP Tables Demonstrated |
|---------|---------------|-------------------------|
| 1 | Registration | person, location, care_site |
| 2 | PCP Visit | visit_occurrence, measurement, condition_occurrence |
| 3 | ED Workup | measurement, procedure_occurrence, note |
| 4 | New AFib Diagnosis | condition_occurrence, observation |
| 5 | Medication Start | drug_exposure |
| 6 | Risk Stratification | observation (CHA₂DS₂-VASc) |
| 7 | Quality Measures | measurement aggregations |
| 8 | Billing & Coding | procedure_occurrence, provider |

### Clinical Timeline

```
Day 1 (Jan 6)  → PCP Visit: Routine check, irregular rhythm found
                → ED Visit: AFib diagnosed, anticoagulation started
Day 3 (Jan 8)  → Cardiology Consult: Rate control initiated
Day 10 (Jan 15) → PCP Follow-up: Improved BP, medication titration
```

## Key Vocabularies Demonstrated

| Vocabulary | Domain | Example |
|------------|--------|---------|
| **SNOMED CT** | Conditions | Atrial fibrillation (313217) |
| **ICD-10-CM** | Diagnosis codes | I48.91, E11.9, I10 |
| **LOINC** | Measurements | 8480-6 (Systolic BP) |
| **RxNorm** | Medications | Apixaban 5mg (1310149) |
| **CPT** | Procedures | 99214, 93306, 93000 |

## Sample Queries

### Patient Demographics
```sql
SELECT p.person_id, p.person_source_value AS mrn,
       EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth AS age,
       gc.concept_name AS gender
FROM cdm.person p
LEFT JOIN vocabulary.concept gc ON p.gender_concept_id = gc.concept_id
WHERE p.person_id = 12345;
```

### Active Conditions with ICD-10 Mapping
```sql
SELECT co.condition_start_date,
       co.condition_source_value AS icd10_code,
       c.concept_name AS snomed_name
FROM cdm.condition_occurrence co
JOIN vocabulary.concept c ON co.condition_concept_id = c.concept_id
WHERE co.person_id = 12345
ORDER BY co.condition_start_date;
```

### CHA₂DS₂-VASc Score Calculation
```sql
SELECT
    CASE WHEN p.gender_concept_id = 8532 THEN 1 ELSE 0 END AS female_point,
    CASE WHEN EXISTS (SELECT 1 FROM cdm.condition_occurrence
                      WHERE condition_concept_id = 320128) THEN 1 ELSE 0 END AS htn_point,
    CASE WHEN EXISTS (SELECT 1 FROM cdm.condition_occurrence
                      WHERE condition_concept_id = 201826) THEN 1 ELSE 0 END AS dm_point
FROM cdm.person p WHERE p.person_id = 12345;
```

## CSV Data Files

Download individual tables for offline analysis or import into other systems:

| File | Records | Description |
|------|---------|-------------|
| `person.csv` | 1 | Patient demographics |
| `visit_occurrence.csv` | 4 | Clinical encounters |
| `condition_occurrence.csv` | 4 | Diagnoses |
| `measurement.csv` | 16 | Vitals and lab results |
| `drug_exposure.csv` | 4 | Medications |
| `procedure_occurrence.csv` | 6 | Procedures |
| `observation.csv` | 4 | Risk scores, social history |
| `note.csv` | 3 | Clinical narratives |
| `provider.csv` | 4 | Care team |
| `care_site.csv` | 4 | Healthcare facilities |
| `location.csv` | 4 | Addresses |
| `data_dictionary.csv` | 35 | Column definitions |

## Learning Path

### Beginner
1. Read Chapter 1-2 of the textbook
2. Load the dataset and run basic SELECT queries
3. Understand the person-visit-condition relationship

### Intermediate
1. Complete all 8 chapters
2. Run all 22 example queries
3. Modify queries to answer your own questions
4. Understand vocabulary mappings (ICD-10 → SNOMED)

### Advanced
1. Calculate clinical risk scores from raw data
2. Build cohort definitions
3. Create quality measure reports
4. Extend the dataset with additional patients

## Related Resources

### OHDSI Resources
- [OMOP CDM Documentation](https://ohdsi.github.io/CommonDataModel/)
- [OHDSI-in-a-Box](https://github.com/OHDSI/OHDSI-in-a-Box)
- [The Book of OHDSI](https://ohdsi.github.io/TheBookOfOhdsi/)
- [ATHENA Vocabulary Browser](https://athena.ohdsi.org/)

### EHDEN Academy
- [OMOP CDM and Standardised Vocabularies](https://academy.ehden.eu/)
- [ETL Fundamentals](https://academy.ehden.eu/)

### Clinical Standards
- [HL7 FHIR](https://www.hl7.org/fhir/)
- [SNOMED CT Browser](https://browser.ihtsdotools.org/)
- [LOINC Database](https://loinc.org/)

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Ways to Contribute
- Report issues or suggest improvements
- Add new example queries
- Create additional patient scenarios
- Improve documentation
- Add data quality tests

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **OHDSI Community** for the OMOP Common Data Model
- **EHDEN Academy** for educational resources
- **Clinical Informatics Community** for domain expertise

---

## Citation

If you use this textbook in your research or teaching, please cite:

```bibtex
@misc{clinical-informatics-textbook,
  author = {Clinical Informatics Textbook Contributors},
  title = {Clinical Informatics Textbook: An OMOP CDM Learning Journey},
  year = {2026},
  publisher = {GitHub},
  url = {https://github.com/yourusername/clinical-informatics-textbook}
}
```

---

**Happy Learning!** 🏥📊

*Questions? Open an issue or reach out to the maintainers.*
