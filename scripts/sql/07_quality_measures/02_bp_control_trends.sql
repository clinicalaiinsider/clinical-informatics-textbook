-- ============================================================================
-- Script: 02_bp_control_trends.sql
-- Chapter: 7 - Quality Measurement & Population Health
-- Textbook Section: 7.2 HEDIS Quality Measure Implementation
--
-- Description:
--   Tracks blood pressure trends across visits for hypertension control
--   quality reporting. Demonstrates longitudinal outcome tracking and
--   how medication changes (Metoprolol) affect BP control measures.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 3 BP readings showing improvement from 148/92 to 132/82
-- ============================================================================

-- Query: Blood Pressure Trend Across Visits
SELECT
    v.visit_start_date,
    MAX(CASE WHEN m.measurement_source_value = '8480-6' THEN m.value_as_number END) AS systolic,
    MAX(CASE WHEN m.measurement_source_value = '8462-4' THEN m.value_as_number END) AS diastolic,
    cs.care_site_name AS location
FROM cdm.visit_occurrence v
JOIN cdm.measurement m ON v.visit_occurrence_id = m.visit_occurrence_id
JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
WHERE v.person_id = 12345
  AND m.measurement_source_value IN ('8480-6', '8462-4')
GROUP BY v.visit_start_date, cs.care_site_name
ORDER BY v.visit_start_date;

-- Expected output:
-- ┌──────────────────┬──────────┬───────────┬───────────────────────────────────┐
-- │ visit_start_date │ systolic │ diastolic │             location              │
-- ├──────────────────┼──────────┼───────────┼───────────────────────────────────┤
-- │ 2026-01-13       │      148 │        92 │ Community Health Clinic           │
-- │ 2026-01-17       │      142 │        88 │ Springfield Cardiology Associates │
-- │ 2026-01-27       │      132 │        82 │ Community Health Clinic           │
-- └──────────────────┴──────────┴───────────┴───────────────────────────────────┘

-- Clinical Quality Interpretation:
-- | Visit Date | BP Reading | HEDIS HTN Control (<140/90) | Trend       |
-- |------------|------------|----------------------------|-------------|
-- | 2026-01-13 | 148/92     | **NOT MET**                | Baseline    |
-- | 2026-01-17 | 142/88     | **NOT MET**                | Improving ↓ |
-- | 2026-01-27 | 132/82     | **MET** ✓                  | At goal     |

-- LOINC Codes Used:
-- | LOINC Code | Description                        |
-- |------------|------------------------------------|
-- | 8480-6     | Systolic blood pressure            |
-- | 8462-4     | Diastolic blood pressure           |

-- Quality Measure Insight:
-- Maria's blood pressure improved from Stage 2 hypertension (148/92) to
-- controlled (<140/90) within two weeks of starting Metoprolol for her
-- atrial fibrillation. The rate control medication had the secondary
-- benefit of improving her blood pressure control, flipping her HTN
-- quality measure from "gap" to "met."
