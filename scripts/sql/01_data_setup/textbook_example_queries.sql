-- =============================================================================
-- CLINICAL INFORMATICS TEXTBOOK - EXAMPLE QUERIES
-- Hands-on SQL queries from each chapter for practice and learning
-- =============================================================================
--
-- This script contains all SQL examples from the Clinical Informatics Textbook
-- organized by chapter. Run these queries against the Maria Rodriguez teaching
-- dataset to practice OMOP CDM querying.
--
-- Prerequisites:
--   1. Run maria_rodriguez_teaching_dataset.sql first
--   2. OMOP vocabulary tables populated
--   3. PostgreSQL database with cdm and vocabulary schemas
--
-- Usage:
--   Execute individual queries or the entire script for learning
--
-- =============================================================================

SET search_path TO cdm, vocabulary, public;

-- =============================================================================
-- CHAPTER 1: THE PATIENT ARRIVES - Registration & Demographics
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 1.1: New Patient Registrations Phenotype
-- Identifies patients who registered for their first visit
-- From Section 1.4: Cohort Design & Phenotyping
-- -----------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------
-- Query 1.2: Patient Demographics Summary
-- Basic patient information retrieval
-- -----------------------------------------------------------------------------

SELECT
    p.person_id,
    p.person_source_value AS mrn,
    gc.concept_name AS gender,
    p.year_of_birth,
    EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth AS age,
    rc.concept_name AS race,
    ec.concept_name AS ethnicity,
    l.city,
    l.state,
    pr.provider_name AS primary_care_provider,
    cs.care_site_name AS primary_care_site
FROM cdm.person p
LEFT JOIN vocabulary.concept gc ON p.gender_concept_id = gc.concept_id
LEFT JOIN vocabulary.concept rc ON p.race_concept_id = rc.concept_id
LEFT JOIN vocabulary.concept ec ON p.ethnicity_concept_id = ec.concept_id
LEFT JOIN cdm.location l ON p.location_id = l.location_id
LEFT JOIN cdm.provider pr ON p.provider_id = pr.provider_id
LEFT JOIN cdm.care_site cs ON p.care_site_id = cs.care_site_id
WHERE p.person_id = 12345;

-- =============================================================================
-- CHAPTER 2: THE CLINICAL ENCOUNTER - Documentation & Diagnosis
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 2.1: Visit Occurrence Insert Example
-- From Section 2.4: OMOP CDM Mapping
-- (This is shown for reference - data already loaded)
-- -----------------------------------------------------------------------------

/*
INSERT INTO cdm.visit_occurrence (
    visit_occurrence_id, person_id, visit_concept_id,
    visit_start_date, visit_start_datetime,
    visit_end_date, visit_end_datetime,
    visit_type_concept_id, provider_id, care_site_id,
    visit_source_value, visit_source_concept_id
) VALUES (
    1001,                    -- Unique visit ID
    12345,                   -- Maria's person_id
    9202,                    -- Outpatient Visit
    '2026-01-13',
    '2026-01-13 11:30:00',
    '2026-01-13',
    '2026-01-13 13:00:00',
    44818518,                -- Visit derived from EHR
    70001,                   -- Dr. Chen's provider_id
    80001,                   -- CHC main clinic
    'encounter-20260113-maria',
    0                        -- No source concept
);
*/

-- -----------------------------------------------------------------------------
-- Query 2.2: New-Onset Atrial Fibrillation Phenotype
-- From Section 2.5: Cohort Design & Phenotyping
-- Identifies patients with first AFib diagnosis
-- -----------------------------------------------------------------------------

WITH afib_concept_set AS (
    -- Get all descendant concepts for atrial fibrillation
    SELECT DISTINCT ca.descendant_concept_id AS concept_id
    FROM vocabulary.concept_ancestor ca
    WHERE ca.ancestor_concept_id = 313217

    UNION

    SELECT 313217 AS concept_id
),
first_afib AS (
    -- Find first AFib diagnosis per patient
    SELECT
        co.person_id,
        MIN(co.condition_start_date) AS first_afib_date
    FROM cdm.condition_occurrence co
    INNER JOIN afib_concept_set acs
        ON co.condition_concept_id = acs.concept_id
    GROUP BY co.person_id
),
patients_with_prior_afib AS (
    -- Identify patients with AFib before their "first" diagnosis
    SELECT DISTINCT f.person_id
    FROM first_afib f
    INNER JOIN cdm.condition_occurrence co
        ON f.person_id = co.person_id
    INNER JOIN afib_concept_set acs
        ON co.condition_concept_id = acs.concept_id
    WHERE co.condition_start_date < f.first_afib_date
),
new_onset_afib_cohort AS (
    SELECT
        f.person_id,
        f.first_afib_date AS index_date,
        p.year_of_birth,
        EXTRACT(YEAR FROM f.first_afib_date) - p.year_of_birth AS age_at_diagnosis,
        CASE p.gender_concept_id
            WHEN 8507 THEN 'Male'
            WHEN 8532 THEN 'Female'
            ELSE 'Other'
        END AS gender
    FROM first_afib f
    INNER JOIN cdm.person p ON f.person_id = p.person_id
    WHERE f.person_id NOT IN (SELECT person_id FROM patients_with_prior_afib)
)
SELECT
    noa.*,
    -- Check for HTN in prior year
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = noa.person_id
          AND co.condition_concept_id IN (320128, 316866) -- HTN concepts
          AND co.condition_start_date BETWEEN
              noa.index_date - INTERVAL '365 days' AND noa.index_date
    ) THEN 1 ELSE 0 END AS has_prior_htn,
    -- Check for DM in prior year
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        INNER JOIN vocabulary.concept_ancestor ca
            ON co.condition_concept_id = ca.descendant_concept_id
        WHERE co.person_id = noa.person_id
          AND ca.ancestor_concept_id = 201826  -- Type 2 DM
          AND co.condition_start_date BETWEEN
              noa.index_date - INTERVAL '365 days' AND noa.index_date
    ) THEN 1 ELSE 0 END AS has_prior_dm
FROM new_onset_afib_cohort noa
WHERE noa.index_date BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY noa.index_date;

-- -----------------------------------------------------------------------------
-- Query 2.3: Patient Conditions with Terminology Codes
-- Retrieves diagnoses with ICD-10 source codes
-- -----------------------------------------------------------------------------

SELECT
    p.person_source_value AS mrn,
    c.concept_name AS condition,
    c.concept_code AS snomed_code,
    c.vocabulary_id,
    co.condition_start_date,
    co.condition_source_value AS icd10_code,
    sc.concept_name AS icd10_description,
    pr.provider_name AS diagnosing_provider,
    cs.care_site_name AS location
FROM cdm.condition_occurrence co
JOIN cdm.person p ON co.person_id = p.person_id
JOIN vocabulary.concept c ON co.condition_concept_id = c.concept_id
LEFT JOIN vocabulary.concept sc ON co.condition_source_concept_id = sc.concept_id
LEFT JOIN cdm.provider pr ON co.provider_id = pr.provider_id
LEFT JOIN cdm.visit_occurrence v ON co.visit_occurrence_id = v.visit_occurrence_id
LEFT JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
WHERE co.person_id = 12345
ORDER BY co.condition_start_date;

-- =============================================================================
-- CHAPTER 3: DIAGNOSTIC WORKUP & ORDERS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 3.1: Vital Signs for a Patient Visit
-- Retrieves measurements recorded during an encounter
-- -----------------------------------------------------------------------------

SELECT
    p.person_source_value AS mrn,
    m.measurement_date,
    m.measurement_datetime,
    c.concept_name AS measurement,
    m.measurement_source_value AS loinc_code,
    m.value_as_number AS value,
    u.concept_name AS unit,
    m.range_low,
    m.range_high,
    CASE
        WHEN m.value_as_number < m.range_low THEN 'LOW'
        WHEN m.value_as_number > m.range_high THEN 'HIGH'
        ELSE 'NORMAL'
    END AS interpretation,
    pr.provider_name AS recorded_by
FROM cdm.measurement m
JOIN cdm.person p ON m.person_id = p.person_id
JOIN vocabulary.concept c ON m.measurement_concept_id = c.concept_id
LEFT JOIN vocabulary.concept u ON m.unit_concept_id = u.concept_id
LEFT JOIN cdm.provider pr ON m.provider_id = pr.provider_id
WHERE m.person_id = 12345
  AND m.measurement_date = '2026-01-13'
  AND m.visit_occurrence_id = 900001  -- Maria's PCP visit
ORDER BY m.measurement_datetime;

-- -----------------------------------------------------------------------------
-- Query 3.2: Lab Results Panel View
-- Groups lab results by test panel
-- -----------------------------------------------------------------------------

SELECT
    m.measurement_date,
    c.concept_name AS test_name,
    m.measurement_source_value AS loinc_code,
    m.value_as_number AS result,
    u.concept_name AS unit,
    m.range_low || ' - ' || m.range_high AS reference_range,
    CASE
        WHEN m.value_as_number < m.range_low THEN 'L'
        WHEN m.value_as_number > m.range_high THEN 'H'
        ELSE ''
    END AS flag,
    tc.concept_name AS measurement_type
FROM cdm.measurement m
JOIN vocabulary.concept c ON m.measurement_concept_id = c.concept_id
LEFT JOIN vocabulary.concept u ON m.unit_concept_id = u.concept_id
LEFT JOIN vocabulary.concept tc ON m.measurement_type_concept_id = tc.concept_id
WHERE m.person_id = 12345
ORDER BY m.measurement_date DESC, c.concept_name;

-- -----------------------------------------------------------------------------
-- Query 3.3: Blood Pressure Trend Analysis
-- Tracks BP readings over time
-- -----------------------------------------------------------------------------

SELECT
    m.measurement_date,
    MAX(CASE WHEN m.measurement_source_value = '8480-6'
        THEN m.value_as_number END) AS systolic_bp,
    MAX(CASE WHEN m.measurement_source_value = '8462-4'
        THEN m.value_as_number END) AS diastolic_bp,
    MAX(CASE WHEN m.measurement_source_value = '8867-4'
        THEN m.value_as_number END) AS heart_rate
FROM cdm.measurement m
WHERE m.person_id = 12345
  AND m.measurement_source_value IN ('8480-6', '8462-4', '8867-4')
GROUP BY m.measurement_date
ORDER BY m.measurement_date;

-- =============================================================================
-- CHAPTER 4: SPECIALTY REFERRAL & CARE COORDINATION
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 4.1: Patient Visit History Across Care Sites
-- Shows all encounters with different providers
-- -----------------------------------------------------------------------------

SELECT
    v.visit_occurrence_id,
    v.visit_start_date,
    vc.concept_name AS visit_type,
    cs.care_site_name,
    pr.provider_name,
    pr.specialty_source_value AS specialty,
    v.visit_source_value AS visit_number
FROM cdm.visit_occurrence v
JOIN vocabulary.concept vc ON v.visit_concept_id = vc.concept_id
LEFT JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
LEFT JOIN cdm.provider pr ON v.provider_id = pr.provider_id
WHERE v.person_id = 12345
ORDER BY v.visit_start_date;

-- -----------------------------------------------------------------------------
-- Query 4.2: Provider Panel
-- Lists all providers involved in a patient's care
-- -----------------------------------------------------------------------------

SELECT DISTINCT
    pr.provider_name,
    pr.specialty_source_value AS specialty,
    pr.npi,
    cs.care_site_name,
    MIN(v.visit_start_date) AS first_seen,
    MAX(v.visit_start_date) AS last_seen,
    COUNT(v.visit_occurrence_id) AS total_visits
FROM cdm.visit_occurrence v
JOIN cdm.provider pr ON v.provider_id = pr.provider_id
LEFT JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
WHERE v.person_id = 12345
GROUP BY pr.provider_id, pr.provider_name, pr.specialty_source_value,
         pr.npi, cs.care_site_name
ORDER BY MAX(v.visit_start_date) DESC;

-- =============================================================================
-- CHAPTER 5: MEDICATION MANAGEMENT & PHARMACOVIGILANCE
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 5.1: Current Medication List
-- Active medications with prescribing details
-- -----------------------------------------------------------------------------

SELECT
    p.person_source_value AS mrn,
    c.concept_name AS medication,
    de.drug_source_value AS rxnorm_code,
    de.drug_exposure_start_date AS start_date,
    de.drug_exposure_end_date AS end_date,
    de.quantity,
    de.days_supply,
    de.sig AS instructions,
    rc.concept_name AS route,
    pr.provider_name AS prescriber
FROM cdm.drug_exposure de
JOIN cdm.person p ON de.person_id = p.person_id
JOIN vocabulary.concept c ON de.drug_concept_id = c.concept_id
LEFT JOIN vocabulary.concept rc ON de.route_concept_id = rc.concept_id
LEFT JOIN cdm.provider pr ON de.provider_id = pr.provider_id
WHERE de.person_id = 12345
  AND (de.drug_exposure_end_date >= CURRENT_DATE OR de.drug_exposure_end_date IS NULL)
ORDER BY de.drug_exposure_start_date DESC;

-- -----------------------------------------------------------------------------
-- Query 5.2: Medication History Timeline
-- Complete medication exposure history
-- -----------------------------------------------------------------------------

SELECT
    c.concept_name AS medication,
    de.drug_exposure_start_date,
    de.drug_exposure_end_date,
    de.days_supply,
    de.quantity,
    de.sig,
    CASE
        WHEN de.drug_exposure_end_date IS NULL THEN 'Active'
        WHEN de.drug_exposure_end_date >= CURRENT_DATE THEN 'Active'
        ELSE 'Discontinued'
    END AS status,
    de.stop_reason
FROM cdm.drug_exposure de
JOIN vocabulary.concept c ON de.drug_concept_id = c.concept_id
WHERE de.person_id = 12345
ORDER BY de.drug_exposure_start_date DESC, c.concept_name;

-- -----------------------------------------------------------------------------
-- Query 5.3: Check for Anticoagulation Coverage
-- Verifies patient has anticoagulation for AFib stroke prevention
-- -----------------------------------------------------------------------------

WITH afib_patients AS (
    SELECT DISTINCT person_id
    FROM cdm.condition_occurrence
    WHERE condition_concept_id = 313217  -- Atrial fibrillation
),
anticoag_drugs AS (
    -- DOACs and Warfarin
    SELECT concept_id FROM vocabulary.concept
    WHERE concept_code IN ('1364430', '1364435', '11289', '855332', '1549682')
    AND vocabulary_id = 'RxNorm'
),
anticoagulated AS (
    SELECT DISTINCT de.person_id
    FROM cdm.drug_exposure de
    JOIN anticoag_drugs ad ON de.drug_concept_id = ad.concept_id
    WHERE de.drug_exposure_end_date >= CURRENT_DATE
       OR de.drug_exposure_end_date IS NULL
)
SELECT
    p.person_id,
    p.person_source_value AS mrn,
    CASE WHEN ac.person_id IS NOT NULL THEN 'On Anticoagulation'
         ELSE 'NOT on Anticoagulation' END AS anticoag_status
FROM afib_patients af
JOIN cdm.person p ON af.person_id = p.person_id
LEFT JOIN anticoagulated ac ON af.person_id = ac.person_id;

-- =============================================================================
-- CHAPTER 6: CLINICAL DECISION SUPPORT & RISK STRATIFICATION
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 6.1: CHA2DS2-VASc Score Components
-- Retrieves data needed for stroke risk calculation
-- -----------------------------------------------------------------------------

SELECT
    p.person_id,
    p.person_source_value AS mrn,

    -- Age calculation
    EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth AS age,
    CASE WHEN EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth >= 75 THEN 2
         WHEN EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth >= 65 THEN 1
         ELSE 0 END AS age_points,

    -- Sex (Female = 1 point)
    CASE WHEN p.gender_concept_id = 8532 THEN 1 ELSE 0 END AS female_points,

    -- CHF
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = p.person_id
          AND co.condition_concept_id IN (316139)  -- Heart failure
    ) THEN 1 ELSE 0 END AS chf_points,

    -- Hypertension
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = p.person_id
          AND co.condition_concept_id = 320128
    ) THEN 1 ELSE 0 END AS htn_points,

    -- Diabetes
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = p.person_id
          AND co.condition_concept_id = 201826
    ) THEN 1 ELSE 0 END AS dm_points,

    -- Stroke/TIA (2 points)
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = p.person_id
          AND co.condition_concept_id IN (443454, 373503)  -- Stroke, TIA
    ) THEN 2 ELSE 0 END AS stroke_points,

    -- Vascular disease
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.condition_occurrence co
        WHERE co.person_id = p.person_id
          AND co.condition_concept_id IN (321318, 317576)  -- CAD, PAD
    ) THEN 1 ELSE 0 END AS vascular_points

FROM cdm.person p
WHERE p.person_id = 12345;

-- -----------------------------------------------------------------------------
-- Query 6.2: Calculate Complete CHA2DS2-VASc Score
-- Returns total score and annual stroke risk
-- -----------------------------------------------------------------------------

WITH score_components AS (
    SELECT
        p.person_id,
        p.person_source_value AS mrn,

        -- Age points
        CASE WHEN EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth >= 75 THEN 2
             WHEN EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth >= 65 THEN 1
             ELSE 0 END AS age_pts,

        -- Female
        CASE WHEN p.gender_concept_id = 8532 THEN 1 ELSE 0 END AS sex_pts,

        -- Comorbidities from conditions table
        COALESCE((
            SELECT 1 FROM cdm.condition_occurrence co
            WHERE co.person_id = p.person_id
              AND co.condition_concept_id = 316139 LIMIT 1
        ), 0) AS chf_pts,

        COALESCE((
            SELECT 1 FROM cdm.condition_occurrence co
            WHERE co.person_id = p.person_id
              AND co.condition_concept_id = 320128 LIMIT 1
        ), 0) AS htn_pts,

        COALESCE((
            SELECT 1 FROM cdm.condition_occurrence co
            WHERE co.person_id = p.person_id
              AND co.condition_concept_id = 201826 LIMIT 1
        ), 0) AS dm_pts,

        COALESCE((
            SELECT 2 FROM cdm.condition_occurrence co
            WHERE co.person_id = p.person_id
              AND co.condition_concept_id IN (443454, 373503) LIMIT 1
        ), 0) AS stroke_pts,

        COALESCE((
            SELECT 1 FROM cdm.condition_occurrence co
            WHERE co.person_id = p.person_id
              AND co.condition_concept_id IN (321318, 317576) LIMIT 1
        ), 0) AS vasc_pts

    FROM cdm.person p
    WHERE p.person_id = 12345
)
SELECT
    person_id,
    mrn,
    chf_pts AS "CHF",
    htn_pts AS "HTN",
    age_pts AS "Age",
    dm_pts AS "DM",
    stroke_pts AS "Stroke/TIA",
    vasc_pts AS "Vascular",
    sex_pts AS "Female",
    (chf_pts + htn_pts + age_pts + dm_pts + stroke_pts + vasc_pts + sex_pts) AS total_score,
    CASE (chf_pts + htn_pts + age_pts + dm_pts + stroke_pts + vasc_pts + sex_pts)
        WHEN 0 THEN '0.2%'
        WHEN 1 THEN '0.6%'
        WHEN 2 THEN '2.2%'
        WHEN 3 THEN '3.2%'
        WHEN 4 THEN '4.8%'
        WHEN 5 THEN '7.2%'
        WHEN 6 THEN '9.7%'
        WHEN 7 THEN '11.2%'
        WHEN 8 THEN '10.8%'
        ELSE '12.2%'
    END AS annual_stroke_risk,
    CASE
        WHEN (chf_pts + htn_pts + age_pts + dm_pts + stroke_pts + vasc_pts + sex_pts) >= 2
        THEN 'Anticoagulation Strongly Recommended'
        WHEN (chf_pts + htn_pts + age_pts + dm_pts + stroke_pts + vasc_pts + sex_pts) = 1
        THEN 'Anticoagulation Should Be Considered'
        ELSE 'No Anticoagulation Indicated'
    END AS recommendation
FROM score_components;

-- =============================================================================
-- CHAPTER 7: QUALITY MEASUREMENT & POPULATION HEALTH
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 7.1: HEDIS Diabetes Eye Exam Measure
-- Identifies diabetic patients who need eye exam (quality gap)
-- From Section 7.2
-- -----------------------------------------------------------------------------

WITH diabetic_population AS (
    -- Identify patients with diabetes diagnosis
    SELECT DISTINCT co.person_id
    FROM cdm.condition_occurrence co
    JOIN vocabulary.concept_ancestor ca
        ON co.condition_concept_id = ca.descendant_concept_id
    WHERE ca.ancestor_concept_id IN (201826, 201254)  -- T2DM, T1DM
    AND co.condition_start_date <= CURRENT_DATE
),
recent_eye_exams AS (
    -- Find eye exams in past 12 months
    SELECT DISTINCT po.person_id
    FROM cdm.procedure_occurrence po
    JOIN vocabulary.concept c ON po.procedure_concept_id = c.concept_id
    WHERE c.concept_code IN (
        '92002', '92004', '92012', '92014',  -- Ophthalmology exams
        '92250', '2022F', '2024F', '2026F',  -- Retinal exams
        '67028', '67030', '67031'            -- Retinal imaging
    )
    AND c.vocabulary_id IN ('CPT4', 'HCPCS')
    AND po.procedure_date >= CURRENT_DATE - INTERVAL '365 days'
)
SELECT
    dp.person_id,
    p.person_source_value AS mrn,
    CASE WHEN re.person_id IS NOT NULL THEN 'MET' ELSE 'GAP' END AS measure_status,
    CASE WHEN re.person_id IS NULL THEN 'Diabetic eye exam needed' ELSE NULL END AS outreach_needed
FROM diabetic_population dp
JOIN cdm.person p ON dp.person_id = p.person_id
LEFT JOIN recent_eye_exams re ON dp.person_id = re.person_id
ORDER BY measure_status DESC, p.person_source_value;

-- -----------------------------------------------------------------------------
-- Query 7.2: Diabetes Quality Dashboard
-- Summary of diabetes quality measures for a patient
-- -----------------------------------------------------------------------------

WITH diabetes_measures AS (
    SELECT person_id FROM cdm.condition_occurrence
    WHERE condition_concept_id = 201826  -- T2DM
)
SELECT
    p.person_source_value AS mrn,

    -- HbA1c Testing (had test in past 12 months)
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.measurement m
        WHERE m.person_id = dm.person_id
          AND m.measurement_source_value = '4548-4'
          AND m.measurement_date >= CURRENT_DATE - INTERVAL '365 days'
    ) THEN 'MET' ELSE 'GAP' END AS hba1c_testing,

    -- Most recent HbA1c value
    (SELECT m.value_as_number FROM cdm.measurement m
     WHERE m.person_id = dm.person_id
       AND m.measurement_source_value = '4548-4'
     ORDER BY m.measurement_date DESC LIMIT 1) AS last_hba1c,

    -- HbA1c Control <8%
    CASE WHEN (
        SELECT m.value_as_number FROM cdm.measurement m
        WHERE m.person_id = dm.person_id
          AND m.measurement_source_value = '4548-4'
        ORDER BY m.measurement_date DESC LIMIT 1
    ) < 8.0 THEN 'MET' ELSE 'GAP' END AS hba1c_control,

    -- BP Control <140/90
    CASE WHEN (
        SELECT m.value_as_number FROM cdm.measurement m
        WHERE m.person_id = dm.person_id
          AND m.measurement_source_value = '8480-6'
        ORDER BY m.measurement_date DESC LIMIT 1
    ) < 140 THEN 'MET' ELSE 'GAP' END AS bp_control,

    -- Nephropathy Screening (eGFR in past year)
    CASE WHEN EXISTS (
        SELECT 1 FROM cdm.measurement m
        WHERE m.person_id = dm.person_id
          AND m.measurement_source_value IN ('98979-8', '33914-3')
          AND m.measurement_date >= CURRENT_DATE - INTERVAL '365 days'
    ) THEN 'MET' ELSE 'GAP' END AS nephropathy_screening

FROM diabetes_measures dm
JOIN cdm.person p ON dm.person_id = p.person_id
WHERE dm.person_id = 12345;

-- =============================================================================
-- CHAPTER 8: BILLING, CODING & REVENUE CYCLE
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 8.1: Encounter Billing Summary
-- CPT codes and diagnoses for a visit
-- -----------------------------------------------------------------------------

SELECT
    v.visit_occurrence_id,
    v.visit_start_date AS service_date,
    p.person_source_value AS mrn,

    -- Procedures/CPT codes
    STRING_AGG(DISTINCT pc.concept_code || ' - ' || pc.concept_name, '; ') AS cpt_codes,

    -- Diagnoses/ICD-10 codes
    STRING_AGG(DISTINCT co.condition_source_value || ' - ' || cc.concept_name, '; ') AS diagnoses

FROM cdm.visit_occurrence v
JOIN cdm.person p ON v.person_id = p.person_id
LEFT JOIN cdm.procedure_occurrence po ON v.visit_occurrence_id = po.visit_occurrence_id
LEFT JOIN vocabulary.concept pc ON po.procedure_concept_id = pc.concept_id
LEFT JOIN cdm.condition_occurrence co ON v.visit_occurrence_id = co.visit_occurrence_id
LEFT JOIN vocabulary.concept cc ON co.condition_concept_id = cc.concept_id
WHERE v.person_id = 12345
  AND v.visit_start_date = '2026-01-13'
GROUP BY v.visit_occurrence_id, v.visit_start_date, p.person_source_value;

-- -----------------------------------------------------------------------------
-- Query 8.2: Procedure Detail with Source Codes
-- Shows procedure occurrence with CPT mapping
-- -----------------------------------------------------------------------------

SELECT
    po.procedure_occurrence_id,
    po.procedure_date,
    c.concept_name AS procedure_name,
    c.concept_code,
    c.vocabulary_id,
    po.procedure_source_value AS source_cpt,
    po.quantity,
    pr.provider_name AS performing_provider,
    cs.care_site_name
FROM cdm.procedure_occurrence po
JOIN vocabulary.concept c ON po.procedure_concept_id = c.concept_id
LEFT JOIN cdm.provider pr ON po.provider_id = pr.provider_id
LEFT JOIN cdm.visit_occurrence v ON po.visit_occurrence_id = v.visit_occurrence_id
LEFT JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
WHERE po.person_id = 12345
ORDER BY po.procedure_date;

-- =============================================================================
-- CHAPTER 10: OUTCOMES, RESEARCH & CONTINUOUS IMPROVEMENT
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query 10.1: AFib Outcomes Study - 1-Year Stroke Rate
-- Research query for anticoagulated AFib patients
-- From Section 10.3
-- -----------------------------------------------------------------------------

WITH afib_cohort AS (
    SELECT DISTINCT
        co.person_id,
        MIN(co.condition_start_date) AS afib_diagnosis_date
    FROM cdm.condition_occurrence co
    WHERE co.condition_concept_id IN (
        SELECT ca.descendant_concept_id
        FROM vocabulary.concept_ancestor ca
        WHERE ca.ancestor_concept_id = 313217  -- Atrial fibrillation
    )
    GROUP BY co.person_id
),
anticoagulated AS (
    SELECT
        a.person_id,
        a.afib_diagnosis_date,
        MIN(de.drug_exposure_start_date) AS anticoag_start_date
    FROM afib_cohort a
    JOIN cdm.drug_exposure de ON a.person_id = de.person_id
    WHERE de.drug_concept_id IN (
        SELECT ca.descendant_concept_id
        FROM vocabulary.concept_ancestor ca
        WHERE ca.ancestor_concept_id IN (
            1310149,  -- Warfarin
            40228152, -- Apixaban
            40241331, -- Rivaroxaban
            43013024, -- Dabigatran
            793143    -- Edoxaban
        )
    )
    AND de.drug_exposure_start_date
        BETWEEN a.afib_diagnosis_date AND a.afib_diagnosis_date + 30
    GROUP BY a.person_id, a.afib_diagnosis_date
),
stroke_outcomes AS (
    SELECT
        ac.person_id,
        ac.afib_diagnosis_date,
        ac.anticoag_start_date,
        MIN(co.condition_start_date) AS stroke_date
    FROM anticoagulated ac
    LEFT JOIN cdm.condition_occurrence co
        ON ac.person_id = co.person_id
        AND co.condition_concept_id IN (
            SELECT ca.descendant_concept_id
            FROM vocabulary.concept_ancestor ca
            WHERE ca.ancestor_concept_id = 381591  -- Ischemic stroke
        )
        AND co.condition_start_date
            BETWEEN ac.anticoag_start_date AND ac.anticoag_start_date + 365
    GROUP BY ac.person_id, ac.afib_diagnosis_date, ac.anticoag_start_date
)
SELECT
    COUNT(*) AS total_patients,
    SUM(CASE WHEN stroke_date IS NOT NULL THEN 1 ELSE 0 END) AS stroke_events,
    ROUND(
        100.0 * SUM(CASE WHEN stroke_date IS NOT NULL THEN 1 ELSE 0 END) /
        NULLIF(COUNT(*), 0),
        2
    ) AS stroke_rate_percent
FROM stroke_outcomes;

-- -----------------------------------------------------------------------------
-- Query 10.2: Patient Longitudinal Timeline
-- Complete chronological view of all clinical events
-- -----------------------------------------------------------------------------

SELECT
    event_date,
    event_type,
    description,
    provider_name,
    care_site_name
FROM (
    -- Visits
    SELECT
        v.visit_start_date AS event_date,
        'Visit' AS event_type,
        vc.concept_name AS description,
        pr.provider_name,
        cs.care_site_name
    FROM cdm.visit_occurrence v
    JOIN vocabulary.concept vc ON v.visit_concept_id = vc.concept_id
    LEFT JOIN cdm.provider pr ON v.provider_id = pr.provider_id
    LEFT JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
    WHERE v.person_id = 12345

    UNION ALL

    -- New Diagnoses
    SELECT
        co.condition_start_date AS event_date,
        'Diagnosis' AS event_type,
        c.concept_name AS description,
        pr.provider_name,
        NULL AS care_site_name
    FROM cdm.condition_occurrence co
    JOIN vocabulary.concept c ON co.condition_concept_id = c.concept_id
    LEFT JOIN cdm.provider pr ON co.provider_id = pr.provider_id
    WHERE co.person_id = 12345

    UNION ALL

    -- Medications Started
    SELECT
        de.drug_exposure_start_date AS event_date,
        'Medication Started' AS event_type,
        c.concept_name AS description,
        pr.provider_name,
        NULL AS care_site_name
    FROM cdm.drug_exposure de
    JOIN vocabulary.concept c ON de.drug_concept_id = c.concept_id
    LEFT JOIN cdm.provider pr ON de.provider_id = pr.provider_id
    WHERE de.person_id = 12345

    UNION ALL

    -- Procedures
    SELECT
        po.procedure_date AS event_date,
        'Procedure' AS event_type,
        c.concept_name AS description,
        pr.provider_name,
        NULL AS care_site_name
    FROM cdm.procedure_occurrence po
    JOIN vocabulary.concept c ON po.procedure_concept_id = c.concept_id
    LEFT JOIN cdm.provider pr ON po.provider_id = pr.provider_id
    WHERE po.person_id = 12345

) timeline
ORDER BY event_date, event_type;

-- =============================================================================
-- APPENDIX QUERIES: TERMINOLOGY REFERENCE
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Query A.1: ICD-10 to SNOMED to OMOP Concept Mapping
-- From Appendix D
-- -----------------------------------------------------------------------------

SELECT
    s.concept_code AS icd10_code,
    s.concept_name AS icd10_description,
    t.concept_id AS omop_concept_id,
    t.concept_code AS snomed_code,
    t.concept_name AS snomed_description
FROM vocabulary.concept s
JOIN vocabulary.concept_relationship cr
    ON s.concept_id = cr.concept_id_1
JOIN vocabulary.concept t
    ON cr.concept_id_2 = t.concept_id
WHERE s.vocabulary_id = 'ICD10CM'
  AND t.vocabulary_id = 'SNOMED'
  AND cr.relationship_id = 'Maps to'
  AND s.concept_code IN ('I48.91', 'I10', 'E11.9', 'E66.9', 'I63.9')
  AND t.standard_concept = 'S';

-- -----------------------------------------------------------------------------
-- Query A.2: RxNorm Drug Hierarchy
-- Shows ingredient to clinical drug to branded drug relationships
-- -----------------------------------------------------------------------------

SELECT
    i.concept_name AS ingredient,
    i.concept_code AS ingredient_rxcui,
    cd.concept_name AS clinical_drug,
    cd.concept_code AS clinical_drug_rxcui,
    bd.concept_name AS branded_drug,
    bd.concept_code AS branded_drug_rxcui
FROM vocabulary.concept i
LEFT JOIN vocabulary.concept_relationship cr1
    ON i.concept_id = cr1.concept_id_1 AND cr1.relationship_id = 'RxNorm has ing'
LEFT JOIN vocabulary.concept cd
    ON cr1.concept_id_2 = cd.concept_id AND cd.concept_class_id = 'Clinical Drug'
LEFT JOIN vocabulary.concept_relationship cr2
    ON cd.concept_id = cr2.concept_id_1 AND cr2.relationship_id = 'Tradename of'
LEFT JOIN vocabulary.concept bd
    ON cr2.concept_id_2 = bd.concept_id
WHERE i.vocabulary_id = 'RxNorm'
  AND i.concept_class_id = 'Ingredient'
  AND i.concept_name ILIKE '%apixaban%'
LIMIT 20;

-- -----------------------------------------------------------------------------
-- Query A.3: LOINC Code Lookup
-- Find measurement concepts by LOINC code
-- -----------------------------------------------------------------------------

SELECT
    c.concept_id AS omop_concept_id,
    c.concept_code AS loinc_code,
    c.concept_name AS measurement_name,
    c.domain_id,
    c.concept_class_id,
    c.standard_concept
FROM vocabulary.concept c
WHERE c.vocabulary_id = 'LOINC'
  AND c.concept_code IN (
    '8480-6',   -- Systolic BP
    '8462-4',   -- Diastolic BP
    '8867-4',   -- Heart rate
    '4548-4',   -- HbA1c
    '2339-0',   -- Glucose
    '3016-3',   -- TSH
    '718-7'     -- Hemoglobin
  );

-- =============================================================================
-- VERIFICATION QUERY
-- Run this to confirm teaching dataset is loaded correctly
-- =============================================================================

SELECT
    'Teaching Dataset Status' AS report,
    '==============================' AS divider
UNION ALL
SELECT 'person', COUNT(*)::text FROM cdm.person WHERE person_id = 12345
UNION ALL
SELECT 'visit_occurrence', COUNT(*)::text FROM cdm.visit_occurrence WHERE person_id = 12345
UNION ALL
SELECT 'condition_occurrence', COUNT(*)::text FROM cdm.condition_occurrence WHERE person_id = 12345
UNION ALL
SELECT 'measurement', COUNT(*)::text FROM cdm.measurement WHERE person_id = 12345
UNION ALL
SELECT 'drug_exposure', COUNT(*)::text FROM cdm.drug_exposure WHERE person_id = 12345
UNION ALL
SELECT 'procedure_occurrence', COUNT(*)::text FROM cdm.procedure_occurrence WHERE person_id = 12345
UNION ALL
SELECT 'observation', COUNT(*)::text FROM cdm.observation WHERE person_id = 12345
UNION ALL
SELECT 'provider', COUNT(*)::text FROM cdm.provider WHERE provider_id BETWEEN 70001 AND 70004
UNION ALL
SELECT 'care_site', COUNT(*)::text FROM cdm.care_site WHERE care_site_id BETWEEN 80001 AND 80002
UNION ALL
SELECT 'location', COUNT(*)::text FROM cdm.location WHERE location_id BETWEEN 90001 AND 90003;

-- =============================================================================
-- END OF EXAMPLE QUERIES
-- =============================================================================
--
-- Summary of Queries by Chapter:
--
-- Chapter 1: Patient Registration
--   - 1.1: New patient registrations phenotype
--   - 1.2: Patient demographics summary
--
-- Chapter 2: Clinical Encounter
--   - 2.1: Visit occurrence insert example
--   - 2.2: New-onset AFib phenotype
--   - 2.3: Patient conditions with terminology codes
--
-- Chapter 3: Diagnostic Workup
--   - 3.1: Vital signs for a patient visit
--   - 3.2: Lab results panel view
--   - 3.3: Blood pressure trend analysis
--
-- Chapter 4: Care Coordination
--   - 4.1: Patient visit history across care sites
--   - 4.2: Provider panel
--
-- Chapter 5: Medication Management
--   - 5.1: Current medication list
--   - 5.2: Medication history timeline
--   - 5.3: Anticoagulation coverage check
--
-- Chapter 6: Clinical Decision Support
--   - 6.1: CHA2DS2-VASc score components
--   - 6.2: Complete CHA2DS2-VASc calculation
--
-- Chapter 7: Quality Measurement
--   - 7.1: HEDIS diabetes eye exam measure
--   - 7.2: Diabetes quality dashboard
--
-- Chapter 8: Revenue Cycle
--   - 8.1: Encounter billing summary
--   - 8.2: Procedure detail with source codes
--
-- Chapter 10: Research & Outcomes
--   - 10.1: AFib outcomes study
--   - 10.2: Patient longitudinal timeline
--
-- Appendix Queries
--   - A.1: ICD-10 to SNOMED mapping
--   - A.2: RxNorm drug hierarchy
--   - A.3: LOINC code lookup
--
-- =============================================================================
