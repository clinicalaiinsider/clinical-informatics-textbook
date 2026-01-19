-- ============================================================================
-- Script: 01_afib_research_cohort.sql
-- Chapter: 10 - Outcomes, Research & Continuous Improvement
-- Textbook Section: 10.3 Research Applications
--
-- Description:
--   OMOP CDM research query to identify AFib patients on anticoagulation
--   and track 1-year stroke outcomes. Demonstrates how standardized
--   OMOP data enables multi-site observational research.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--   - Vocabulary tables with concept_ancestor populated
--
-- Expected Results:
--   Returns cohort statistics for anticoagulated AFib patients
-- ============================================================================

-- Research Query: 1-Year Stroke Rate in Anticoagulated AFib Patients
-- OMOP CDM Schema

WITH afib_cohort AS (
    SELECT DISTINCT
        co.person_id,
        MIN(co.condition_start_date) AS afib_diagnosis_date
    FROM cdm.condition_occurrence co
    WHERE co.condition_concept_id IN (
        SELECT descendant_concept_id
        FROM vocabulary.concept_ancestor
        WHERE ancestor_concept_id = 313217  -- Atrial fibrillation
    )
    GROUP BY co.person_id
),
anticoagulated AS (
    SELECT
        a.person_id,
        a.afib_diagnosis_date,
        MIN(de.drug_exposure_start_date) AS anticoag_start_date
    FROM afib_cohort a
    JOIN cdm.drug_exposure de ON a.person_id = de.person_id
    WHERE de.drug_concept_id IN (
        SELECT descendant_concept_id
        FROM vocabulary.concept_ancestor
        WHERE ancestor_concept_id IN (
            1310149,  -- Warfarin
            40228152, -- Apixaban
            40241331, -- Rivaroxaban
            43013024, -- Dabigatran
            793143    -- Edoxaban
        )
    )
    AND de.drug_exposure_start_date
        BETWEEN a.afib_diagnosis_date AND a.afib_diagnosis_date + 30
    GROUP BY a.person_id, a.afib_diagnosis_date
),
stroke_outcomes AS (
    SELECT
        ac.person_id,
        ac.afib_diagnosis_date,
        ac.anticoag_start_date,
        MIN(co.condition_start_date) AS stroke_date
    FROM anticoagulated ac
    LEFT JOIN cdm.condition_occurrence co
        ON ac.person_id = co.person_id
        AND co.condition_concept_id IN (
            SELECT descendant_concept_id
            FROM vocabulary.concept_ancestor
            WHERE ancestor_concept_id = 381591  -- Ischemic stroke
        )
        AND co.condition_start_date
            BETWEEN ac.anticoag_start_date AND ac.anticoag_start_date + 365
    GROUP BY ac.person_id, ac.afib_diagnosis_date, ac.anticoag_start_date
)
SELECT
    COUNT(*) AS total_patients,
    SUM(CASE WHEN stroke_date IS NOT NULL THEN 1 ELSE 0 END) AS stroke_events,
    ROUND(
        100.0 * SUM(CASE WHEN stroke_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS stroke_rate_percent,
    AVG(stroke_date - anticoag_start_date) AS avg_days_to_stroke
FROM stroke_outcomes;

-- Expected output (with full dataset):
-- ┌────────────────┬───────────────┬─────────────────────┬───────────────────┐
-- │ total_patients │ stroke_events │ stroke_rate_percent │ avg_days_to_stroke│
-- ├────────────────┼───────────────┼─────────────────────┼───────────────────┤
-- │              1 │             0 │                0.00 │              NULL │
-- └────────────────┴───────────────┴─────────────────────┴───────────────────┘

-- Research Study Design:
-- | Element           | Definition                                      |
-- |-------------------|------------------------------------------------|
-- | Target Cohort     | AFib patients starting anticoagulation within 30d |
-- | Index Date        | Anticoagulation start date                      |
-- | Outcome           | Ischemic stroke within 1 year                   |
-- | Time-at-Risk      | Index + 1 day to Index + 365 days              |
-- | Exclusions        | None in this simplified example                 |

-- OHDSI Network Considerations:
-- 1. This query runs identically across all OHDSI network sites
-- 2. Results can be aggregated without sharing patient-level data
-- 3. CONCEPT_ANCESTOR enables consistent phenotyping across vocabularies
-- 4. Real-world evidence from 800+ million patients worldwide

-- Anticoagulant Concept IDs:
-- | Drug        | OMOP Concept ID | RxNorm |
-- |-------------|-----------------|--------|
-- | Warfarin    | 1310149         | 11289  |
-- | Apixaban    | 40228152        | 1364435|
-- | Rivaroxaban | 40241331        | 1114195|
-- | Dabigatran  | 43013024        | 1037042|
-- | Edoxaban    | 793143          | 1599538|
