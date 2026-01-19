-- ============================================================================
-- Script: 01_insert_drug_exposure.sql
-- Chapter: 5 - Medication Management
-- Textbook Section: 5.3 OMOP Drug Exposure
--
-- Description:
--   Demonstrates inserting medication records into OMOP drug_exposure
--   table for Maria's current medications including new AFib therapies.
--
-- Prerequisites:
--   - PostgreSQL database with OMOP CDM schema
--   - Person record exists (person_id: 12345)
--   - Visit records exist
--
-- Key Concepts:
--   - RxNorm codes for drug identification
--   - drug_type_concept_id indicates source (prescription, administered)
--   - sig field stores human-readable instructions
-- ============================================================================

-- Insert Maria's current medications into OMOP drug_exposure table
INSERT INTO cdm.drug_exposure (
    drug_exposure_id, person_id, drug_concept_id,
    drug_exposure_start_date, drug_exposure_start_datetime,
    drug_exposure_end_date, drug_exposure_end_datetime,
    verbatim_end_date, drug_type_concept_id,
    stop_reason, refills, quantity, days_supply,
    sig, route_concept_id, lot_number,
    provider_id, visit_occurrence_id, visit_detail_id,
    drug_source_value, drug_source_concept_id,
    route_source_value, dose_unit_source_value
) VALUES
-- Apixaban (NEW - for AFib stroke prevention)
(5001, 12345, 40228152, '2026-01-13', '2026-01-13 13:00:00',
 '2026-02-12', NULL, NULL, 32838, NULL, 5, 60, 30,
 '5 mg by mouth twice daily', 4132161, NULL,
 101, 1001, NULL, '1364435', 40228152, 'Oral', 'mg'),

-- Metoprolol Succinate 50mg (increased from 25mg for rate control)
(5002, 12345, 40165015, '2026-01-17', '2026-01-17 17:30:00',
 '2026-02-16', NULL, NULL, 32838, NULL, 5, 30, 30,
 '50 mg by mouth once daily', 4132161, NULL,
 103, 1002, NULL, '866926', 40165015, 'Oral', 'mg'),

-- Metformin (increased dose for better glycemic control)
(5003, 12345, 40164929, '2026-01-13', '2026-01-13 13:00:00',
 '2026-02-12', NULL, NULL, 32838, NULL, 5, 60, 30,
 '1000 mg by mouth twice daily', 4132161, NULL,
 101, 1001, NULL, '861007', 40164929, 'Oral', 'mg'),

-- Lisinopril (longstanding medication for HTN)
(5004, 12345, 40163999, '2021-03-15', '2021-03-15 10:00:00',
 NULL, NULL, NULL, 32838, NULL, 11, 30, 30,
 '20 mg by mouth once daily', 4132161, NULL,
 101, NULL, NULL, '314076', 40163999, 'Oral', 'mg');

-- Concept Reference:
-- drug_type_concept_id = 32838 = Prescription written
-- route_concept_id = 4132161 = Oral route
--
-- RxNorm Codes (drug_source_value):
-- 1364435 = Apixaban 5 MG Oral Tablet (SCD - Clinical Drug)
-- 866926 = Metoprolol Succinate ER 50 MG (SCD)
-- 861007 = Metformin (IN - Ingredient level)
-- 314076 = Lisinopril 20 MG (SCD)
--
-- Clinical Context:
-- - Apixaban: CHA2DS2-VASc score = 3, anticoagulation indicated
-- - Metoprolol: Rate control for AFib (target HR 60-80)
-- - Metformin: Diabetes management (HbA1c 8.2%)
-- - Lisinopril: Blood pressure control (goal <130/80)
