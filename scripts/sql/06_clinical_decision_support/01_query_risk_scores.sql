-- ============================================================================
-- Script: 01_query_risk_scores.sql
-- Chapter: 6 - Clinical Decision Support
-- Textbook Section: 6.2 Risk Scores Implementation
--
-- Description:
--   Queries clinical risk scores (CHA2DS2-VASc and HAS-BLED) from the
--   OMOP observation table. Risk scores are stored as observations
--   with interpretation values.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 2 rows: CHA2DS2-VASc=3 (HIGH) and HAS-BLED=1 (LOW)
-- ============================================================================

-- Query: Clinical Risk Scores
SELECT
    o.observation_date,
    o.observation_source_value AS score_type,
    o.value_as_number AS score,
    o.value_as_string AS interpretation
FROM cdm.observation o
WHERE o.person_id = 12345
  AND o.observation_source_value IN ('CHA2DS2-VASc', 'HAS-BLED')
ORDER BY o.observation_source_value;

-- Expected output:
-- ┌──────────────────┬──────────────────┬───────┬───────────────────┐
-- │ observation_date │    score_type    │ score │  interpretation   │
-- ├──────────────────┼──────────────────┼───────┼───────────────────┤
-- │ 2026-01-13       │ CHA2DS2-VASc     │     3 │ HIGH stroke risk  │
-- │ 2026-01-13       │ HAS-BLED         │     1 │ LOW bleeding risk │
-- └──────────────────┴──────────────────┴───────┴───────────────────┘

-- Clinical Decision Support Interpretation:
-- | Score        | Value | Risk Level | Clinical Action                    |
-- |--------------|-------|------------|------------------------------------|
-- | CHA2DS2-VASc | 3     | HIGH       | Anticoagulation strongly indicated |
-- | HAS-BLED     | 1     | LOW        | Low bleeding risk, safe to proceed |

-- Note: The combination of HIGH stroke risk and LOW bleeding risk
-- provides strong justification for initiating oral anticoagulation (Apixaban).
