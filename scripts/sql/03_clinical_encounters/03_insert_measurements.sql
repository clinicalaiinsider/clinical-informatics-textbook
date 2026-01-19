-- ============================================================================
-- Script: 03_insert_measurements.sql
-- Chapter: 2 - The Clinical Encounter
-- Textbook Section: 2.4 OMOP CDM Mapping
--
-- Description:
--   Demonstrates inserting measurement records for vital signs
--   (blood pressure and glucose) captured during Maria's visit.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Person record exists (person_id: 12345)
--   - Visit record exists (visit_occurrence_id: 1001)
--
-- Key Concepts:
--   - LOINC codes for measurement identification
--   - Unit concepts for standardized units
--   - Reference ranges for clinical interpretation
-- ============================================================================

-- Blood Pressure - Systolic
INSERT INTO cdm.measurement (
    measurement_id,
    person_id,
    measurement_concept_id,
    measurement_date,
    measurement_datetime,
    measurement_time,
    measurement_type_concept_id,
    operator_concept_id,
    value_as_number,
    value_as_concept_id,
    unit_concept_id,
    range_low,
    range_high,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    measurement_source_value,
    measurement_source_concept_id,
    unit_source_value,
    value_source_value
) VALUES (
    3001,                    -- Unique measurement ID
    12345,                   -- Maria's person_id
    3004249,                 -- Systolic BP concept (LOINC 8480-6)
    '2026-01-13',            -- Measurement date
    '2026-01-13 11:47:00',   -- Measurement datetime
    '11:47:00',              -- Time only
    44818701,                -- From physical exam
    NULL,                    -- No operator (equals)
    148,                     -- Measured value (elevated!)
    NULL,                    -- No categorical value
    8876,                    -- mmHg unit concept
    90,                      -- Normal range low
    120,                     -- Normal range high
    102,                     -- Lisa Brown RN (took vitals)
    1001,                    -- Associated visit
    NULL,                    -- No visit detail
    '8480-6',                -- LOINC code
    3004249,                 -- Source concept same as standard
    'mmHg',                  -- Source unit
    '148'                    -- Source value as string
);

-- Random Glucose
INSERT INTO cdm.measurement (
    measurement_id,
    person_id,
    measurement_concept_id,
    measurement_date,
    measurement_datetime,
    measurement_type_concept_id,
    value_as_number,
    unit_concept_id,
    range_low,
    range_high,
    provider_id,
    visit_occurrence_id,
    measurement_source_value,
    unit_source_value
) VALUES (
    3010,                    -- Unique measurement ID
    12345,                   -- Maria's person_id
    3004501,                 -- Glucose concept (LOINC 2339-0)
    '2026-01-13',            -- Measurement date
    '2026-01-13 11:50:00',   -- Measurement datetime
    44818702,                -- From lab test
    218,                     -- Measured value (significantly elevated!)
    8840,                    -- mg/dL unit concept
    70,                      -- Normal range low
    140,                     -- Normal range high (random glucose)
    102,                     -- Lisa Brown RN
    1001,                    -- Associated visit
    '2339-0',                -- LOINC code
    'mg/dL'                  -- Source unit
);

-- Concept Reference:
-- measurement_concept_id = 3004249 = Systolic blood pressure (LOINC 8480-6)
-- measurement_concept_id = 3004501 = Glucose [Mass/volume] in Blood (LOINC 2339-0)
-- unit_concept_id = 8876 = mmHg
-- unit_concept_id = 8840 = mg/dL
-- measurement_type_concept_id = 44818701 = From physical examination
-- measurement_type_concept_id = 44818702 = Lab result
