-- ============================================================================
-- Script: 04_provider_panel_analysis.sql
-- Chapter: 7 - Quality Measurement & Population Health
-- Textbook Section: 7.2 HEDIS Quality Measure Implementation
--
-- Description:
--   Provider panel analysis showing care team members, specialties,
--   and NPIs for quality attribution and panel management.
--   Essential for value-based care reporting.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Teaching dataset loaded (maria_rodriguez_teaching_dataset.sql)
--
-- Expected Results:
--   Returns 4 providers with specialties (Family Medicine, Cardiology, etc.)
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

-- Provider Panel Analysis for Quality Reporting:
-- | Provider        | Role                  | NPI Required | Quality Attribution |
-- |-----------------|----------------------|--------------|---------------------|
-- | Sarah Chen, MD  | Primary Care         | Yes          | HEDIS measures      |
-- | Lisa Brown, RN  | Care Coordination    | No           | Support role        |
-- | Michael Torres  | Cardiology Specialist| Yes          | AFib quality        |
-- | Jessica Martinez| Pharmacy             | No           | MTM services        |

-- Value-Based Care Considerations:
-- 1. PCP attribution: Dr. Chen is Maria's PCP for quality measure reporting
-- 2. Specialty care: Dr. Torres handles AFib-specific quality measures
-- 3. Care team model: RN and PharmD support quality improvement
-- 4. NPI tracking: Required for claims and quality reporting

-- Panel Management Query Extension:
-- To get panel size per provider:
-- SELECT pr.provider_name, COUNT(DISTINCT v.person_id) as panel_size
-- FROM cdm.provider pr
-- JOIN cdm.visit_occurrence v ON pr.provider_id = v.provider_id
-- GROUP BY pr.provider_name
-- ORDER BY panel_size DESC;
