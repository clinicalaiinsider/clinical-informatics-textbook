-- ============================================================================
-- Script: 05_query_conditions.sql
-- Chapter: 2 - The Clinical Encounter
-- Textbook Section: 2.4 OMOP CDM Mapping
--
-- Description:
--   Queries active conditions with ICD-10 to SNOMED mapping,
--   demonstrating OMOP's vocabulary standardization approach.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 4 conditions: HTN, Obesity, T2DM, AFib with onset dates
-- ============================================================================

-- Query: Conditions with Source-to-Standard Concept Mapping
SELECT
    co.condition_start_date AS onset_date,
    c.concept_name AS condition_snomed,
    co.condition_source_value AS icd10_code,
    sc.concept_name AS icd10_description
FROM cdm.condition_occurrence co
JOIN vocabulary.concept c ON co.condition_concept_id = c.concept_id
LEFT JOIN vocabulary.concept sc ON co.condition_source_concept_id = sc.concept_id
WHERE co.person_id = 12345
ORDER BY co.condition_start_date;

-- Expected output:
-- ┌────────────┬──────────────────────────┬────────────┬───────────────────────────────────┐
-- │ onset_date │     condition_snomed     │ icd10_code │        icd10_description          │
-- ├────────────┼──────────────────────────┼────────────┼───────────────────────────────────┤
-- │ 2021-03-10 │ Essential hypertension   │ I10        │ Essential (primary) hypertension  │
-- │ 2021-03-10 │ Obesity                  │ E66.9      │ Obesity, unspecified              │
-- │ 2023-01-15 │ Type 2 diabetes mellitus │ E11.9      │ Type 2 diabetes without comp.     │
-- │ 2026-01-13 │ Atrial fibrillation      │ I48.91     │ Unspecified atrial fibrillation   │
-- └────────────┴──────────────────────────┴────────────┴───────────────────────────────────┘
-- (4 rows)

-- Key Insight:
-- This query demonstrates OMOP vocabulary mapping:
-- - condition_source_value: Original ICD-10-CM code from EHR
-- - condition_concept_id: Mapped to SNOMED CT standard concept
-- - This enables consistent querying across systems using different source codes
