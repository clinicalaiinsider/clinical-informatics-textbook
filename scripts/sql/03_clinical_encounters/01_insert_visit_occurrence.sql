-- ============================================================================
-- Script: 01_insert_visit_occurrence.sql
-- Chapter: 2 - The Clinical Encounter
-- Textbook Section: 2.4 OMOP CDM Mapping
--
-- Description:
--   Demonstrates inserting a visit_occurrence record for Maria's
--   outpatient visit at Community Health Clinic.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Person record exists (person_id: 12345)
--   - Teaching dataset may already include this visit
--
-- Note:
--   This is an educational INSERT example. The teaching dataset
--   already contains this data - run on a fresh schema to test.
-- ============================================================================

-- Visit Occurrence INSERT example for Maria's PCP visit
INSERT INTO cdm.visit_occurrence (
    visit_occurrence_id,
    person_id,
    visit_concept_id,
    visit_start_date,
    visit_start_datetime,
    visit_end_date,
    visit_end_datetime,
    visit_type_concept_id,
    provider_id,
    care_site_id,
    visit_source_value,
    visit_source_concept_id
) VALUES (
    1001,                    -- Unique visit ID
    12345,                   -- Maria's person_id
    9202,                    -- Outpatient Visit (concept_id)
    '2026-01-13',            -- Visit start date
    '2026-01-13 11:30:00',   -- Visit start datetime
    '2026-01-13',            -- Visit end date (same day)
    '2026-01-13 13:00:00',   -- Visit end datetime
    44818518,                -- Visit derived from EHR
    101,                     -- Dr. Chen's provider_id
    1,                       -- CHC main clinic care_site_id
    'encounter-20260113-maria',  -- Source system identifier
    0                        -- No source concept
);

-- Concept Reference:
-- visit_concept_id = 9202 = Outpatient Visit
-- visit_type_concept_id = 44818518 = Visit derived from EHR encounter record
