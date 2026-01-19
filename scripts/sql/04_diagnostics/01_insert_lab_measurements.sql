-- ============================================================================
-- Script: 01_insert_lab_measurements.sql
-- Chapter: 3 - Diagnostic Workup
-- Textbook Section: 3.5 OMOP CDM Mapping
--
-- Description:
--   Demonstrates inserting multiple lab results into the OMOP measurement
--   table as part of Maria's AFib workup (TSH, CBC, CMP, Lipids).
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Person record exists (person_id: 12345)
--   - Visit record exists (visit_occurrence_id: 1001)
--
-- Key Concepts:
--   - measurement_type_concept_id = 32856 indicates lab result
--   - LOINC codes stored in measurement_source_value
--   - Reference ranges stored for clinical interpretation
-- ============================================================================

-- Insert lab results into OMOP measurement table
INSERT INTO cdm.measurement (
    measurement_id, person_id, measurement_concept_id,
    measurement_date, measurement_datetime, measurement_type_concept_id,
    value_as_number, unit_concept_id, range_low, range_high,
    provider_id, visit_occurrence_id,
    measurement_source_value, measurement_source_concept_id, unit_source_value
) VALUES
-- TSH (to rule out hyperthyroidism as AFib cause)
(4001, 12345, 3019701, '2026-01-14', '2026-01-14 10:00:00',
 32856, 1.8, 8549, 0.4, 4.0, 101, 1001, '3016-3', 3019701, 'mIU/L'),

-- Hemoglobin (part of CBC)
(4002, 12345, 3000963, '2026-01-14', '2026-01-14 10:00:00',
 32856, 12.8, 8713, 12.0, 16.0, 101, 1001, '718-7', 3000963, 'g/dL'),

-- Fasting Glucose
(4003, 12345, 3004501, '2026-01-14', '2026-01-14 10:00:00',
 32856, 142, 8840, 70, 100, 101, 1001, '2345-7', 3004501, 'mg/dL'),

-- Creatinine (for eGFR calculation and Apixaban dosing)
(4004, 12345, 3016723, '2026-01-14', '2026-01-14 10:00:00',
 32856, 0.9, 8840, 0.6, 1.2, 101, 1001, '2160-0', 3016723, 'mg/dL'),

-- eGFR (determines anticoagulant dosing)
(4005, 12345, 46236952, '2026-01-14', '2026-01-14 10:00:00',
 32856, 82, 8698, 60, NULL, 101, 1001, '98979-8', 46236952, 'mL/min/1.73m2'),

-- Total Cholesterol (cardiovascular risk assessment)
(4006, 12345, 3027114, '2026-01-14', '2026-01-14 10:00:00',
 32856, 218, 8840, NULL, 200, 101, 1001, '2093-3', 3027114, 'mg/dL'),

-- LDL Cholesterol (statin decision)
(4007, 12345, 3028437, '2026-01-14', '2026-01-14 10:00:00',
 32856, 139, 8840, NULL, 100, 101, 1001, '13457-7', 3028437, 'mg/dL');

-- Concept Reference:
-- measurement_type_concept_id = 32856 = Lab result
-- Unit concepts:
--   8549 = mIU/L (TSH)
--   8713 = g/dL (Hemoglobin)
--   8840 = mg/dL (Glucose, Creatinine, Cholesterol)
--   8698 = mL/min/1.73m2 (eGFR)
--
-- Clinical Significance:
-- - TSH 1.8: Normal, rules out hyperthyroidism as AFib cause
-- - eGFR 82: Normal kidney function, no Apixaban dose reduction needed
-- - Glucose 142: Elevated, diabetes not optimally controlled
-- - LDL 139: Above goal, consider statin therapy
