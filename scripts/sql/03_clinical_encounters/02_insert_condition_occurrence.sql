-- ============================================================================
-- Script: 02_insert_condition_occurrence.sql
-- Chapter: 2 - The Clinical Encounter
-- Textbook Section: 2.4 OMOP CDM Mapping
--
-- Description:
--   Demonstrates inserting a condition_occurrence record for Maria's
--   newly diagnosed atrial fibrillation with ICD-10 to SNOMED mapping.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Person record exists (person_id: 12345)
--   - Visit record exists (visit_occurrence_id: 1001)
--
-- Key Concepts:
--   - condition_concept_id: SNOMED CT standard concept
--   - condition_source_value: Original ICD-10-CM code
--   - condition_source_concept_id: ICD-10-CM concept for mapping
-- ============================================================================

-- Condition Occurrence INSERT for Atrial Fibrillation diagnosis
INSERT INTO cdm.condition_occurrence (
    condition_occurrence_id,
    person_id,
    condition_concept_id,
    condition_start_date,
    condition_start_datetime,
    condition_end_date,
    condition_end_datetime,
    condition_type_concept_id,
    condition_status_concept_id,
    stop_reason,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    condition_source_value,
    condition_source_concept_id
) VALUES (
    2001,                    -- Unique condition ID
    12345,                   -- Maria's person_id
    313217,                  -- Atrial fibrillation (SNOMED CT standard concept)
    '2026-01-13',            -- Diagnosis date
    '2026-01-13 12:18:00',   -- Time of EKG confirmation
    NULL,                    -- End date unknown (ongoing condition)
    NULL,                    -- End datetime
    32817,                   -- EHR problem list entry
    NULL,                    -- Status concept (active by default)
    NULL,                    -- No stop reason
    101,                     -- Dr. Chen (diagnosing provider)
    1001,                    -- Associated visit occurrence
    NULL,                    -- No visit detail
    'I48.91',                -- Source ICD-10-CM code
    45572061                 -- ICD-10-CM concept_id for I48.91
);

-- Concept Reference:
-- condition_concept_id = 313217 = Atrial fibrillation (SNOMED CT)
-- condition_source_concept_id = 45572061 = I48.91 (ICD-10-CM)
-- condition_type_concept_id = 32817 = EHR problem list entry

-- This demonstrates OMOP vocabulary mapping:
-- Source code (I48.91 ICD-10-CM) -> Standard concept (313217 SNOMED CT)
