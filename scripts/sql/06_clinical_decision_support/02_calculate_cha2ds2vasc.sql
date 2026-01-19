-- ============================================================================
-- Script: 02_calculate_cha2ds2vasc.sql
-- Chapter: 6 - Clinical Decision Support
-- Textbook Section: 6.2 Risk Scores Implementation
--
-- Description:
--   SQL implementation of CHA2DS2-VASc score calculation directly from
--   OMOP CDM data. Demonstrates how CDS algorithms can compute risk
--   scores from standardized clinical data.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns Maria's CHA2DS2-VASc component breakdown and total score of 3
-- ============================================================================

-- Query: Calculate CHA2DS2-VASc Score from OMOP CDM data
WITH patient_data AS (
    SELECT
        p.person_id,
        p.gender_concept_id,
        EXTRACT(YEAR FROM AGE('2026-01-13', MAKE_DATE(p.year_of_birth, 1, 1))) AS age
    FROM cdm.person p
    WHERE p.person_id = 12345
),
condition_flags AS (
    SELECT
        p.person_id,
        MAX(CASE WHEN co.condition_concept_id = 316139 THEN 1 ELSE 0 END) AS has_chf,
        MAX(CASE WHEN co.condition_concept_id = 320128 THEN 1 ELSE 0 END) AS has_htn,
        MAX(CASE WHEN co.condition_concept_id = 201826 THEN 1 ELSE 0 END) AS has_dm,
        MAX(CASE WHEN co.condition_concept_id IN (312327, 443454) THEN 1 ELSE 0 END) AS has_stroke
    FROM cdm.person p
    LEFT JOIN cdm.condition_occurrence co ON p.person_id = co.person_id
    WHERE p.person_id = 12345
    GROUP BY p.person_id
)
SELECT
    pd.person_id,
    pd.age,
    CASE WHEN pd.gender_concept_id = 8532 THEN 'Female' ELSE 'Male' END AS gender,
    cf.has_chf AS "C (CHF)",
    cf.has_htn AS "H (HTN)",
    CASE WHEN pd.age >= 75 THEN 2 WHEN pd.age >= 65 THEN 1 ELSE 0 END AS "A (Age)",
    cf.has_dm AS "D (DM)",
    cf.has_stroke * 2 AS "S (Stroke)",
    CASE WHEN pd.gender_concept_id = 8532 THEN 1 ELSE 0 END AS "Sc (Female)",
    -- Calculate total score
    cf.has_chf + cf.has_htn +
    CASE WHEN pd.age >= 75 THEN 2 WHEN pd.age >= 65 THEN 1 ELSE 0 END +
    cf.has_dm + (cf.has_stroke * 2) +
    CASE WHEN pd.gender_concept_id = 8532 THEN 1 ELSE 0 END AS total_score
FROM patient_data pd
JOIN condition_flags cf ON pd.person_id = cf.person_id;

-- Expected output:
-- ┌───────────┬─────┬────────┬─────────┬─────────┬─────────┬────────┬────────────┬────────────┬─────────────┐
-- │ person_id │ age │ gender │ C (CHF) │ H (HTN) │ A (Age) │ D (DM) │ S (Stroke) │ Sc (Female)│ total_score │
-- ├───────────┼─────┼────────┼─────────┼─────────┼─────────┼────────┼────────────┼────────────┼─────────────┤
-- │     12345 │  46 │ Female │       0 │       1 │       0 │      1 │          0 │          1 │           3 │
-- └───────────┴─────┴────────┴─────────┴─────────┴─────────┴────────┴────────────┴────────────┴─────────────┘

-- CHA2DS2-VASc Score Interpretation:
-- | Score | Annual Stroke Risk | Recommendation                        |
-- |-------|--------------------|---------------------------------------|
-- | 0     | 0.2%               | No anticoagulation (males only)       |
-- | 1     | 0.6%               | Consider anticoagulation              |
-- | 2     | 2.2%               | Anticoagulation recommended           |
-- | 3     | 3.2%               | Anticoagulation strongly recommended  |
-- | 4     | 4.8%               | Anticoagulation strongly recommended  |
-- | 5+    | 7.2%+              | Anticoagulation strongly recommended  |

-- Maria's Score Breakdown:
-- | Component | Points | Maria's Status                |
-- |-----------|--------|-------------------------------|
-- | C (CHF)   | 0      | No heart failure              |
-- | H (HTN)   | 1      | Has hypertension              |
-- | A (Age)   | 0      | Age 46, under 65              |
-- | D (DM)    | 1      | Has Type 2 Diabetes           |
-- | S (Stroke)| 0      | No prior stroke/TIA           |
-- | V (Vasc)  | 0      | No vascular disease (not in query) |
-- | A (65-74) | 0      | Age under 65                  |
-- | Sc (Sex)  | 1      | Female                        |
-- | TOTAL     | 3      | HIGH RISK - Anticoag indicated|

-- Note: This SQL demonstrates how CDS algorithms can calculate risk scores
-- directly from OMOP CDM data, enabling both real-time clinical alerts
-- and retrospective population analysis.
