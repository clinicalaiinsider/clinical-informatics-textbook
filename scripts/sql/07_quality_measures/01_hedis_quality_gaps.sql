-- ============================================================================
-- Script: 01_hedis_quality_gaps.sql
-- Chapter: 7 - Quality Measurement & Population Health
-- Textbook Section: 7.2 HEDIS Quality Measure Implementation
--
-- Description:
--   HEDIS Comprehensive Diabetes Care: Eye Exam measure implementation.
--   Identifies diabetic patients who are due for an eye exam (care gap).
--   Uses CONCEPT_ANCESTOR for diabetes identification and CPT codes
--   for eye exam procedures.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--   - Vocabulary tables with concept_ancestor populated
--
-- Expected Results:
--   Returns Maria Rodriguez with status=GAP (eye exam needed)
-- ============================================================================

-- HEDIS Comprehensive Diabetes Care: Eye Exam
-- Identifies diabetic patients who need eye exam

WITH diabetic_population AS (
    -- Identify patients with diabetes diagnosis
    SELECT DISTINCT co.person_id
    FROM cdm.condition_occurrence co
    JOIN vocabulary.concept_ancestor ca
        ON co.condition_concept_id = ca.descendant_concept_id
    WHERE ca.ancestor_concept_id IN (201826, 201254)  -- T2DM, T1DM
    AND co.condition_start_date <= CURRENT_DATE
),
recent_eye_exams AS (
    -- Find eye exams in past 12 months
    SELECT DISTINCT po.person_id
    FROM cdm.procedure_occurrence po
    JOIN vocabulary.concept c ON po.procedure_concept_id = c.concept_id
    WHERE c.concept_code IN (
        '92002', '92004', '92012', '92014',  -- Ophthalmology exams
        '92250', '2022F', '2024F', '2026F',  -- Retinal exams
        '67028', '67030', '67031'            -- Retinal imaging
    )
    AND c.vocabulary_id IN ('CPT4', 'HCPCS')
    AND po.procedure_date >= CURRENT_DATE - INTERVAL '365 days'
)
SELECT
    dp.person_id,
    p.person_source_value AS mrn,
    CASE WHEN re.person_id IS NOT NULL THEN 'MET' ELSE 'GAP' END AS measure_status,
    CASE WHEN re.person_id IS NULL THEN 'Diabetic eye exam needed' ELSE NULL END AS outreach_needed
FROM diabetic_population dp
JOIN cdm.person p ON dp.person_id = p.person_id
LEFT JOIN recent_eye_exams re ON dp.person_id = re.person_id
WHERE re.person_id IS NULL  -- Only show patients with gap
ORDER BY p.person_source_value;

-- Expected output:
-- ┌───────────┬────────────────┬────────────────┬─────────────────────────┐
-- │ person_id │      mrn       │ measure_status │     outreach_needed     │
-- ├───────────┼────────────────┼────────────────┼─────────────────────────┤
-- │     12345 │ MRN-2024-78432 │ GAP            │ Diabetic eye exam needed│
-- └───────────┴────────────────┴────────────────┴─────────────────────────┘

-- HEDIS Quality Measure Context:
-- | Measure | Denominator | Numerator | Maria's Status |
-- |---------|-------------|-----------|----------------|
-- | CDC Eye Exam | Diabetics 18-75 | Eye exam in past year | GAP |
-- | CDC HbA1c Control | Diabetics 18-75 | HbA1c <8% | NOT MET (8.2%) |
-- | HTN Control | Hypertensives | BP <140/90 | Varies by visit |

-- Population Health Actions:
-- 1. Generate outreach list for patients with GAPs
-- 2. Schedule eye exam appointments
-- 3. Send patient reminders
-- 4. Track measure numerator improvement
