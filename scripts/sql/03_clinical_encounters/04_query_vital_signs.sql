-- ============================================================================
-- Script: 04_query_vital_signs.sql
-- Chapter: 2 - The Clinical Encounter
-- Textbook Section: 2.4 OMOP CDM Mapping
--
-- Description:
--   Queries vital signs from Maria's PCP visit, demonstrating joins
--   to vocabulary tables for human-readable names and units.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 10 rows of vital signs and point-of-care tests
-- ============================================================================

-- Query: Vital Signs from PCP Visit (January 13, 2026)
SELECT
    c.concept_name AS measurement,
    m.value_as_number AS value,
    u.concept_name AS unit,
    m.measurement_source_value AS loinc_code
FROM cdm.measurement m
JOIN vocabulary.concept c ON m.measurement_concept_id = c.concept_id
LEFT JOIN vocabulary.concept u ON m.unit_concept_id = u.concept_id
WHERE m.person_id = 12345
  AND m.visit_occurrence_id = 900001  -- First visit (PCP)
ORDER BY m.measurement_datetime;

-- Expected output:
-- ┌───────────────────────────────────────────────────────────────┬────────┬───────────────────────────┬────────────┐
-- │                        measurement                            │ value  │           unit            │ loinc_code │
-- ├───────────────────────────────────────────────────────────────┼────────┼───────────────────────────┼────────────┤
-- │ Respiratory rate                                              │     18 │ counts per minute         │ 9279-1     │
-- │ Heart rate                                                    │     98 │ per minute                │ 8867-4     │
-- │ Oxygen saturation in Arterial blood by Pulse oximetry         │     97 │ percent                   │ 2708-6     │
-- │ Body height                                                   │ 162.56 │ centimeter                │ 8302-2     │
-- │ Body weight                                                   │    187 │ pound (US)                │ 29463-7    │
-- │ Glucose [Mass/volume] in Serum or Plasma                      │    218 │ milligram per deciliter   │ 2339-0     │
-- │ Diastolic blood pressure                                      │     92 │ millimeter mercury column │ 8462-4     │
-- │ Systolic blood pressure                                       │    148 │ millimeter mercury column │ 8480-6     │
-- │ Body mass index (BMI) [Ratio]                                 │   32.1 │ kilogram per square meter │ 39156-5    │
-- │ Body temperature                                              │   98.4 │ degree Celsius            │ 8310-5     │
-- └───────────────────────────────────────────────────────────────┴────────┴───────────────────────────┴────────────┘

-- Clinical Interpretation:
-- - Blood Pressure 148/92 mmHg: Stage 2 hypertension (above 140/90)
-- - Heart Rate 98 bpm: Elevated and irregular
-- - Random Glucose 218 mg/dL: Significantly elevated (normal <140)
-- - BMI 32.1 kg/m²: Obese Class I
