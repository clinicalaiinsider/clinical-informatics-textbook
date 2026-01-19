-- ============================================================================
-- Script: 02_billable_procedures.sql
-- Chapter: 8 - Billing, Coding & Revenue Cycle
-- Textbook Section: 8.3 Claims Generation
--
-- Description:
--   Queries billable procedures with CPT codes for revenue cycle
--   reporting. Links procedures to visits, providers, and care sites
--   for professional claim (CMS-1500) generation.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 6 procedures across 4 visits with CPT codes and providers
-- ============================================================================

-- Query: Billable Procedures with CPT Codes
SELECT
    po.procedure_date,
    po.procedure_source_value AS cpt_code,
    CASE po.procedure_source_value
        WHEN '93000' THEN 'EKG, 12-lead with interpretation'
        WHEN '99214' THEN 'Office visit, established, moderate'
        WHEN '93306' THEN 'Echocardiogram, complete'
    END AS procedure_description,
    pr.provider_name,
    cs.care_site_name
FROM cdm.procedure_occurrence po
JOIN cdm.provider pr ON po.provider_id = pr.provider_id
JOIN cdm.visit_occurrence v ON po.visit_occurrence_id = v.visit_occurrence_id
JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
WHERE po.person_id = 12345
ORDER BY po.procedure_date;

-- Expected output:
-- ┌────────────────┬──────────┬─────────────────────────────────────┬────────────────────┬───────────────────────────────────┐
-- │ procedure_date │ cpt_code │         procedure_description       │   provider_name    │          care_site_name           │
-- ├────────────────┼──────────┼─────────────────────────────────────┼────────────────────┼───────────────────────────────────┤
-- │ 2026-01-13     │ 93000    │ EKG, 12-lead with interpretation    │ Sarah Chen, MD     │ Community Health Clinic           │
-- │ 2026-01-13     │ 99214    │ Office visit, established, moderate │ Sarah Chen, MD     │ Community Health Clinic           │
-- │ 2026-01-17     │ 93306    │ Echocardiogram, complete            │ Michael Torres, MD │ Springfield Cardiology Associates │
-- │ 2026-01-17     │ 99214    │ Office visit, established, moderate │ Michael Torres, MD │ Springfield Cardiology Associates │
-- │ 2026-01-27     │ 99214    │ Office visit, established, moderate │ Sarah Chen, MD     │ Community Health Clinic           │
-- │ 2026-02-14     │ 99214    │ Office visit, established, moderate │ Michael Torres, MD │ Springfield Cardiology Associates │
-- └────────────────┴──────────┴─────────────────────────────────────┴────────────────────┴───────────────────────────────────┘

-- Revenue Cycle Analysis:
-- | Visit Date | Procedures    | Est. Medicare | Notes                       |
-- |------------|---------------|---------------|-----------------------------|
-- | 2026-01-13 | 99214 + 93000 | ~$114         | EKG justified by new arrhythmia |
-- | 2026-01-17 | 99214 + 93306 | ~$314         | Echo for structural evaluation  |
-- | 2026-01-27 | 99214         | ~$89          | Follow-up, BP improved          |
-- | 2026-02-14 | 99214         | ~$89          | AFib follow-up                  |
-- | **TOTAL**  |               | **~$606**     | Across 4 visits                 |

-- CPT Code Reference (Maria's procedures):
-- | CPT   | Description              | RVU   | Est. Medicare |
-- |-------|--------------------------|-------|---------------|
-- | 99214 | E&M Office, established  | 1.92  | ~$89          |
-- | 93000 | EKG, 12-lead complete    | 0.54  | ~$25          |
-- | 93306 | Echo, TTE complete       | 4.85  | ~$225         |

-- Claims Generation Notes:
-- 1. Each row generates a service line on CMS-1500
-- 2. Multiple procedures on same date = multiple lines
-- 3. Link diagnosis codes (ICD-10) to justify procedures
-- 4. POS (Place of Service) = 11 for office visits
