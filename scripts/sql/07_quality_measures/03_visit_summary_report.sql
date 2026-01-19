-- ============================================================================
-- Script: 03_visit_summary_report.sql
-- Chapter: 7 - Quality Measurement & Population Health
-- Textbook Section: 7.2 HEDIS Quality Measure Implementation
--
-- Description:
--   Complete visit history with providers and care sites for care team
--   coordination and quality reporting. Shows the care pathway from
--   initial diagnosis through cardiology referral and follow-up.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 4 visits across 2 care sites with assigned providers
-- ============================================================================

-- Query: Complete Visit History with Providers
SELECT
    v.visit_occurrence_id,
    v.visit_start_date,
    vc.concept_name AS visit_type,
    cs.care_site_name,
    pr.provider_name
FROM cdm.visit_occurrence v
JOIN vocabulary.concept vc ON v.visit_concept_id = vc.concept_id
JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
JOIN cdm.provider pr ON v.provider_id = pr.provider_id
WHERE v.person_id = 12345
ORDER BY v.visit_start_date;

-- Expected output:
-- ┌─────────────────────┬──────────────────┬──────────────────┬───────────────────────────────────┬────────────────────┐
-- │ visit_occurrence_id │ visit_start_date │    visit_type    │          care_site_name           │   provider_name    │
-- ├─────────────────────┼──────────────────┼──────────────────┼───────────────────────────────────┼────────────────────┤
-- │              900001 │ 2026-01-13       │ Outpatient Visit │ Community Health Clinic           │ Sarah Chen, MD     │
-- │              900002 │ 2026-01-17       │ Outpatient Visit │ Springfield Cardiology Associates │ Michael Torres, MD │
-- │              900003 │ 2026-01-27       │ Outpatient Visit │ Community Health Clinic           │ Sarah Chen, MD     │
-- │              900004 │ 2026-02-14       │ Outpatient Visit │ Springfield Cardiology Associates │ Michael Torres, MD │
-- └─────────────────────┴──────────────────┴──────────────────┴───────────────────────────────────┴────────────────────┘

-- Care Coordination Summary:
-- | Date       | Provider        | Setting              | Purpose                    |
-- |------------|-----------------|----------------------|----------------------------|
-- | 2026-01-13 | Dr. Sarah Chen  | Community Health     | Initial AFib diagnosis     |
-- | 2026-01-17 | Dr. Torres      | Cardiology           | Echo, AFib management plan |
-- | 2026-01-27 | Dr. Sarah Chen  | Community Health     | Follow-up, BP improved     |
-- | 2026-02-14 | Dr. Torres      | Cardiology           | AFib follow-up             |

-- Quality Reporting Use Cases:
-- 1. Care continuity tracking - PCP and specialist coordination
-- 2. Provider panel attribution - assign patients to PCPs
-- 3. Visit volume reporting - encounters per provider/site
-- 4. Referral completion tracking - specialist visits after referral
