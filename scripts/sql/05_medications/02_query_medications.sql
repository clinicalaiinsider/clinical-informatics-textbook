-- ============================================================================
-- Script: 02_query_medications.sql
-- Chapter: 5 - Medication Management
-- Textbook Section: 5.3 OMOP Drug Exposure
--
-- Description:
--   Queries active medications from OMOP drug_exposure table,
--   demonstrating RxNorm concept joins for medication names.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 4 medications: Lisinopril, Metformin, Apixaban, Metoprolol
-- ============================================================================

-- Query: Active Medications with RxNorm Codes
SELECT
    de.drug_exposure_start_date AS start_date,
    c.concept_name AS medication,
    de.quantity,
    de.days_supply,
    de.sig AS instructions,
    de.drug_source_value AS rxnorm_code
FROM cdm.drug_exposure de
JOIN vocabulary.concept c ON de.drug_concept_id = c.concept_id
WHERE de.person_id = 12345
ORDER BY de.drug_exposure_start_date;

-- Expected output:
-- ┌────────────┬──────────────────────────────────┬──────────┬─────────────┬──────────────────────────────────────────────┬─────────────┐
-- │ start_date │            medication            │ quantity │ days_supply │                 instructions                 │ rxnorm_code │
-- ├────────────┼──────────────────────────────────┼──────────┼─────────────┼──────────────────────────────────────────────┼─────────────┤
-- │ 2021-03-10 │ lisinopril                       │       30 │          30 │ Take 20 mg by mouth once daily               │ 314076      │
-- │ 2023-01-15 │ metformin                        │       60 │          30 │ Take 1000 mg by mouth twice daily with meals │ 861007      │
-- │ 2026-01-13 │ Apixaban 5 MG Oral Tablet        │       60 │          30 │ Take 5 mg by mouth twice daily               │ 1364435     │
-- │ 2026-01-13 │ Metoprolol Succinate ER 25 MG    │       30 │          30 │ Take 25 mg by mouth once daily               │ 866924      │
-- └────────────┴──────────────────────────────────┴──────────┴─────────────┴──────────────────────────────────────────────┴─────────────┘

-- Medication Analysis:
-- | Medication       | Indication        | RxNorm Level | Note                      |
-- |-----------------|-------------------|--------------|---------------------------|
-- | Lisinopril 20mg | Hypertension      | SCD          | Long-standing medication  |
-- | Metformin 1000mg| Type 2 Diabetes   | IN           | Ingredient-level code     |
-- | Apixaban 5mg    | AFib (stroke Px)  | SCD          | New with AFib diagnosis   |
-- | Metoprolol 25mg | AFib (rate ctrl)  | SCD          | New for rate control      |

-- Note: RxNorm hierarchy allows querying at different levels:
-- - IN (Ingredient): Find all patients on "metformin" regardless of dose/form
-- - SCD (Clinical Drug): Specific dose and form
-- - Use CONCEPT_ANCESTOR to traverse the hierarchy
