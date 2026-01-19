-- ============================================================================
-- Script: 01_new_patient_registrations.sql
-- Chapter: 1 - Patient Registration
-- Textbook Section: 1.4 Cohort Design and Phenotyping
--
-- Description:
--   Identifies new patient registrations at Community Health Clinic
--   using OMOP CDM phenotype definition pattern.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 1 row for Maria Rodriguez (person_id: 12345)
-- ============================================================================

-- Phenotype: New Patient Registrations in January 2026
-- Database: PostgreSQL with OMOP CDM v5.4

SELECT
    p.person_id,
    p.person_source_value AS mrn,
    p.gender_concept_id,
    gc.concept_name AS gender,
    p.year_of_birth,
    p.race_concept_id,
    rc.concept_name AS race,
    p.ethnicity_concept_id,
    ec.concept_name AS ethnicity,
    v.visit_occurrence_id,
    v.visit_start_date AS registration_date,
    v.visit_concept_id,
    vc.concept_name AS visit_type,
    cs.care_site_name AS clinic_location
FROM cdm.person p
INNER JOIN cdm.visit_occurrence v
    ON p.person_id = v.person_id
INNER JOIN vocabulary.concept gc
    ON p.gender_concept_id = gc.concept_id
INNER JOIN vocabulary.concept rc
    ON p.race_concept_id = rc.concept_id
INNER JOIN vocabulary.concept ec
    ON p.ethnicity_concept_id = ec.concept_id
INNER JOIN vocabulary.concept vc
    ON v.visit_concept_id = vc.concept_id
LEFT JOIN cdm.care_site cs
    ON v.care_site_id = cs.care_site_id
WHERE v.visit_concept_id = 9202  -- Outpatient Visit
    AND v.visit_start_date BETWEEN '2026-01-01' AND '2026-01-31'
    AND NOT EXISTS (
        -- Exclude patients with prior visits
        SELECT 1
        FROM cdm.visit_occurrence v_prior
        WHERE v_prior.person_id = p.person_id
            AND v_prior.visit_start_date < v.visit_start_date
    )
ORDER BY v.visit_start_date;
