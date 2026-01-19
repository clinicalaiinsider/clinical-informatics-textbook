-- ============================================================================
-- Script: 02_patient_demographics.sql
-- Chapter: 1 - Patient Registration
-- Textbook Section: 1.4 Cohort Design and Phenotyping
--
-- Description:
--   Retrieves patient demographics with care site information from OMOP CDM.
--   Demonstrates joining person table with vocabulary and location tables.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns Maria Rodriguez's demographics with location (Springfield, IL)
-- ============================================================================

-- Query: Patient Demographics with Care Site
SELECT
    p.person_id,
    p.person_source_value AS mrn,
    EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth AS age,
    gc.concept_name AS gender,
    rc.concept_name AS race,
    ec.concept_name AS ethnicity,
    l.city,
    l.state
FROM cdm.person p
LEFT JOIN vocabulary.concept gc ON p.gender_concept_id = gc.concept_id
LEFT JOIN vocabulary.concept rc ON p.race_concept_id = rc.concept_id
LEFT JOIN vocabulary.concept ec ON p.ethnicity_concept_id = ec.concept_id
LEFT JOIN cdm.location l ON p.location_id = l.location_id
WHERE p.person_id = 12345;

-- Expected output:
-- ┌───────────┬──────────┬─────┬────────┬───────┬────────────────────┬─────────────┬───────┐
-- │ person_id │   mrn    │ age │ gender │ race  │     ethnicity      │    city     │ state │
-- ├───────────┼──────────┼─────┼────────┼───────┼────────────────────┼─────────────┼───────┤
-- │     12345 │ MRN12345 │  47 │ FEMALE │ White │ Hispanic or Latino │ Springfield │ IL    │
-- └───────────┴──────────┴─────┴────────┴───────┴────────────────────┴─────────────┴───────┘
