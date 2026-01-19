-- ============================================================================
-- Script: 01_query_provider_info.sql
-- Chapter: 8 - Billing, Coding & Revenue Cycle
-- Textbook Section: 8.3 Claims Generation
--
-- Description:
--   Queries provider information including names, specialties, and NPIs
--   for claims generation and billing purposes. NPI is required for
--   professional claims submission.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 4 providers with NPI for physicians, none for RN/PharmD
-- ============================================================================

-- Query: Care Team Information
SELECT
    pr.provider_id,
    pr.provider_name,
    pr.specialty_source_value AS specialty,
    pr.npi
FROM cdm.provider pr
WHERE pr.provider_id IN (70001, 70002, 70003, 70004);

-- Expected output:
-- ┌─────────────┬──────────────────────────┬──────────────────┬────────────┐
-- │ provider_id │      provider_name       │    specialty     │    npi     │
-- ├─────────────┼──────────────────────────┼──────────────────┼────────────┤
-- │       70001 │ Sarah Chen, MD           │ Family Medicine  │ 1234567890 │
-- │       70002 │ Lisa Brown, RN           │ Registered Nurse │            │
-- │       70003 │ Michael Torres, MD       │ Cardiology       │ 0987654321 │
-- │       70004 │ Jessica Martinez, PharmD │ Pharmacist       │            │
-- └─────────────┴──────────────────────────┴──────────────────┴────────────┘

-- Billing Context:
-- | Provider        | NPI        | Billing Role            | Claim Type |
-- |-----------------|------------|-------------------------|------------|
-- | Sarah Chen, MD  | 1234567890 | Rendering Provider      | CMS-1500   |
-- | Lisa Brown, RN  | (none)     | Incident-to under MD    | N/A        |
-- | Michael Torres  | 0987654321 | Rendering Provider      | CMS-1500   |
-- | Jessica Martinez| (none)     | MTM services (separate) | NCPDP      |

-- NPI (National Provider Identifier) Requirements:
-- - Required for all HIPAA-covered transactions
-- - 10-digit identifier assigned by CMS
-- - Physicians, NPs, PAs have individual NPIs
-- - Facilities have Type 2 organizational NPIs
-- - RNs typically don't have individual NPIs (bill under supervising MD)
