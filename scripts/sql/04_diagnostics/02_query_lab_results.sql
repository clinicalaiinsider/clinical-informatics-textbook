-- ============================================================================
-- Script: 02_query_lab_results.sql
-- Chapter: 3 - Diagnostic Workup
-- Textbook Section: 3.5 OMOP CDM Mapping
--
-- Description:
--   Queries laboratory results from OMOP measurement table, filtering
--   by measurement_type_concept_id to exclude vital signs and get only
--   lab values with their reference ranges.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns ~9 lab results including TSH, CBC, CMP components
-- ============================================================================

-- Query: Lab Results (Type = 32856 indicates lab result)
SELECT
    m.measurement_date,
    c.concept_name AS lab_test,
    m.value_as_number AS result,
    u.concept_name AS unit,
    CONCAT(m.range_low, '-', m.range_high) AS reference_range,
    m.measurement_source_value AS loinc_code
FROM cdm.measurement m
JOIN vocabulary.concept c ON m.measurement_concept_id = c.concept_id
LEFT JOIN vocabulary.concept u ON m.unit_concept_id = u.concept_id
WHERE m.person_id = 12345
  AND m.measurement_type_concept_id = 32856  -- Lab results only (not vital signs)
ORDER BY m.measurement_date, c.concept_name;

-- Expected output:
-- ┌──────────────────┬───────────────────────────────────────────────┬────────┬─────────────────────────┬─────────────────┬────────────┐
-- │ measurement_date │                   lab_test                    │ result │          unit           │ reference_range │ loinc_code │
-- ├──────────────────┼───────────────────────────────────────────────┼────────┼─────────────────────────┼─────────────────┼────────────┤
-- │ 2026-01-10       │ Creatinine [Mass/volume] in Serum or Plasma   │    0.9 │ milligram per deciliter │ 0.6-1.2         │ 2160-0     │
-- │ 2026-01-10       │ Glomerular filtration rate/1.73 sq M (MDRD)   │     65 │ per microliter          │ 60-120          │ 98979-8    │
-- │ 2026-01-10       │ Glucose [Mass/volume] in Serum or Plasma      │    162 │ milligram per deciliter │ 70-100          │ 2339-0     │
-- │ 2026-01-10       │ Hemoglobin A1c [Mass/volume] in Blood         │    8.2 │ percent                 │ 4.0-5.6         │ 4548-4     │
-- │ 2026-01-16       │ Hematocrit [Volume Fraction] of Blood         │   38.2 │ percent                 │ 36-46           │ 4544-3     │
-- │ 2026-01-16       │ Hemoglobin [Mass/volume] in Blood             │   12.8 │ gram per deciliter      │ 12.0-16.0       │ 718-7      │
-- │ 2026-01-16       │ Leukocytes [#/volume] in Blood                │    7.2 │ cells per microliter    │ 4.5-11.0        │ 6690-2     │
-- │ 2026-01-16       │ Platelets [#/volume] in Blood                 │    245 │ cells per microliter    │ 150-400         │ 777-3      │
-- │ 2026-01-16       │ TSH [Units/volume] in Serum or Plasma         │    1.8 │ microgram per deciliter │ 0.4-4.0         │ 3016-3     │
-- └──────────────────┴───────────────────────────────────────────────┴────────┴─────────────────────────┴─────────────────┴────────────┘

-- Clinical Interpretation:
-- | Test           | Result | Clinical Implication                            |
-- |----------------|--------|------------------------------------------------|
-- | HbA1c 8.2%     | HIGH   | Diabetes not optimally controlled              |
-- | Fasting Glucose| HIGH   | Confirms poor glycemic control                 |
-- | TSH 1.8        | NORMAL | Rules out hyperthyroidism as AFib cause        |
-- | eGFR 65        | NORMAL | No Apixaban dose reduction needed              |
-- | CBC            | NORMAL | No anemia or infection contributing to symptoms|
