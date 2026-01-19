-- ============================================================================
-- Script: 06_new_onset_afib_phenotype.sql
-- Chapter: 2 - The Clinical Encounter
-- Textbook Section: 2.5 Cohort Design & Phenotyping
--
-- Description:
--   Implements a clinical phenotype for identifying patients with
--   newly diagnosed atrial fibrillation using OHDSI methodologies.
--   Demonstrates CTE-based cohort construction with CONCEPT_ANCESTOR.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--   - Vocabulary tables with concept_ancestor populated
--
-- Clinical Definition:
--   New-onset AFib = First AFib diagnosis with no prior AFib in lookback
--
-- Expected Results:
--   Returns Maria Rodriguez with her risk factors (HTN: 1, DM: 1)
-- ============================================================================

-- Phenotype: New-Onset Atrial Fibrillation
-- Identifies first AFib diagnosis with no prior history

WITH afib_concept_set AS (
    -- Get all descendant concepts for atrial fibrillation
    -- This captures all AFib subtypes (paroxysmal, persistent, permanent, etc.)
    SELECT DISTINCT descendant_concept_id AS concept_id
    FROM vocabulary.concept_ancestor
    WHERE ancestor_concept_id = 313217

    UNION

    -- Include the ancestor concept itself
    SELECT 313217 AS concept_id
),
first_afib AS (
    -- Find first AFib diagnosis per patient
    SELECT
        co.person_id,
        MIN(co.condition_start_date) AS first_afib_date
    FROM cdm.condition_occurrence co
    INNER JOIN afib_concept_set acs
        ON co.condition_concept_id = acs.concept_id
    GROUP BY co.person_id
),
patients_with_prior_afib AS (
    -- Identify patients with AFib before their "first" diagnosis
    -- (to handle data from before observation period)
    SELECT DISTINCT f.person_id
    FROM first_afib f
    INNER JOIN cdm.condition_occurrence co
        ON f.person_id = co.person_id
    INNER JOIN afib_concept_set acs
        ON co.condition_concept_id = acs.concept_id
    WHERE co.condition_start_date < f.first_afib_date
),
new_onset_afib_cohort AS (
    -- Build the final cohort: First AFib with no prior history
    SELECT
        f.person_id,
        f.first_afib_date AS index_date,
        p.year_of_birth,
        EXTRACT(YEAR FROM f.first_afib_date) - p.year_of_birth AS age_at_diagnosis,
        CASE p.gender_concept_id
            WHEN 8507 THEN 'Male'
            WHEN 8532 THEN 'Female'
            ELSE 'Other'
        END AS gender
    FROM first_afib f
    INNER JOIN cdm.person p ON f.person_id = p.person_id
    WHERE f.person_id NOT IN (SELECT person_id FROM patients_with_prior_afib)
)
SELECT
    noa.*,
    -- Check for Hypertension in prior year (for CHA2DS2-VASc)
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = noa.person_id
          AND co.condition_concept_id IN (320128, 316866) -- HTN concepts
          AND co.condition_start_date BETWEEN
              noa.index_date - INTERVAL '365 days' AND noa.index_date
    ) THEN 1 ELSE 0 END AS has_prior_htn,
    -- Check for Diabetes in prior year (for CHA2DS2-VASc)
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = noa.person_id
          AND co.condition_concept_id IN (
              SELECT descendant_concept_id
              FROM vocabulary.concept_ancestor
              WHERE ancestor_concept_id = 201826  -- Type 2 DM
          )
          AND co.condition_start_date BETWEEN
              noa.index_date - INTERVAL '365 days' AND noa.index_date
    ) THEN 1 ELSE 0 END AS has_prior_dm
FROM new_onset_afib_cohort noa
WHERE noa.index_date BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY noa.index_date;

-- Expected output for Maria:
-- ┌───────────┬────────────┬───────────────┬──────────────────┬────────┬──────────────┬──────────────┐
-- │ person_id │ index_date │ year_of_birth │ age_at_diagnosis │ gender │ has_prior_htn│ has_prior_dm │
-- ├───────────┼────────────┼───────────────┼──────────────────┼────────┼──────────────┼──────────────┤
-- │     12345 │ 2026-01-13 │          1979 │               47 │ Female │            1 │            1 │
-- └───────────┴────────────┴───────────────┴──────────────────┴────────┴──────────────┴──────────────┘

-- Clinical Significance:
-- This phenotype can be used for:
-- 1. Quality measure reporting (anticoagulation in AFib)
-- 2. Research cohort identification
-- 3. Population health management
-- 4. CHA2DS2-VASc score component derivation
