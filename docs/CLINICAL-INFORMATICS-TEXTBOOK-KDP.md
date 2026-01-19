<a id="cover-page"></a>
<div align="center">

<img src="../assets/cover-page.jpg" alt="Clinical Informatics - A Provider's Journey Through Healthcare Data" width="500" style="max-width: 100%; height: auto;" />

---

### *A Comprehensive Clinical Practice Guide with*
### *Case Studies, Workflows & Technology Solutions*

---

**First Edition**

---

*Following the complete clinical journey of a single patient through*
*registration, diagnosis, treatment, and long-term management—*
*demonstrating how healthcare data flows from bedside to research*

---

**Clinical AI Insider**

**2026**

---

</div>

<div style="page-break-after: always;"></div>

---

# Title Page

<div align="center">

## Clinical Informatics: A Provider's Journey Through Healthcare Data

### A Comprehensive Clinical Practice Guide with Case Studies, Workflows & Technology Solutions

---

**By Clinical AI Insider**

---

**First Edition — January 2026**

---

### Technical Domains Covered:

| Domain | Standards |
|:------:|:---------:|
| Clinical Documentation | HL7 v2, HL7 FHIR R4, C-CDA |
| Medical Terminologies | ICD-10-CM, SNOMED CT, LOINC, RxNorm, CPT |
| Research Data Models | OMOP CDM 5.4, OHDSI Network |
| Clinical Decision Support | CHA₂DS₂-VASc, HAS-BLED, HEDIS |

---

</div>

<div style="page-break-after: always;"></div>

---

# Copyright & Disclaimer

<div align="center">

## IMPORTANT NOTICE

</div>

---

### Copyright Notice

**© 2026 Clinical AI Insider. All rights reserved.**

No part of this publication may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the author, except in the case of brief quotations embodied in critical reviews and certain other noncommercial uses permitted by copyright law.

---

### Disclaimer Regarding Fictitious Content

<div style="background-color: #f8f9fa; padding: 20px; border-left: 4px solid #dc3545; margin: 20px 0;">

**THIS IS A WORK OF EDUCATIONAL FICTION**

**All patient names, clinical provider names, healthcare organizations, addresses, and specific clinical details presented in this textbook are entirely fictitious.** They have been created solely for educational purposes to illustrate realistic clinical scenarios for learning healthcare informatics and data analysis concepts.

**Specifically:**

- **Maria Rodriguez** is a composite fictional character. Any resemblance to actual persons, living or deceased, is purely coincidental.

- **Community Health Clinic**, **Springfield Family Medicine**, **Springfield General Hospital**, **Springfield Cardiology Associates**, and all other healthcare facilities mentioned are fictional organizations created for this educational work.

- **Dr. Sarah Chen**, **Dr. Michael Torres**, **Dr. Amanda Williams**, **Lisa Brown, RN**, **Jessica Martinez, PharmD**, and all other clinical providers and staff members are fictional characters.

- All **Medical Record Numbers (MRNs)**, **National Provider Identifiers (NPIs)**, **addresses**, **phone numbers**, and other identifying information are fabricated.

- All **clinical data**, including vital signs, laboratory values, medication dosages, and diagnostic findings, while clinically plausible, are fictional and created to demonstrate data workflows.

**This textbook should NOT be used for:**
- Actual clinical decision-making
- Medical diagnosis or treatment
- Patient care guidance

**This textbook IS designed for:**
- Learning healthcare informatics concepts
- Understanding clinical data workflows
- Practicing SQL queries on standardized data models
- Educational demonstrations of OMOP CDM, HL7 FHIR, and terminology mapping

</div>

---

### Medical Disclaimer

The clinical information presented in this textbook is for educational purposes only and does not constitute medical advice. Healthcare decisions should always be made in consultation with qualified healthcare providers based on individual patient circumstances.

---

### Trademark Notice

- **OMOP** and **OHDSI** are trademarks of the Observational Health Data Sciences and Informatics collaborative
- **HL7®** and **FHIR®** are registered trademarks of Health Level Seven International
- **SNOMED CT®** is a registered trademark of SNOMED International
- **LOINC®** is a registered trademark of the Regenstrief Institute, Inc.
- **CPT®** is a registered trademark of the American Medical Association

All other trademarks are the property of their respective owners.

---

<div style="page-break-after: always;"></div>

---

# Table of Contents

## Front Matter
- [Cover Page](#cover-page)
- [Title Page](#title-page)
- [Copyright & Disclaimer](#copyright-disclaimer)
- [Table of Contents](#table-of-contents)
- [List of Tables](#list-of-tables)
- [List of Figures](#list-of-figures)
- [Preface](#preface)
- [How to Use This Book](#how-to-use-this-book)
- [Meet the Clinical Team](#meet-the-clinical-team)
- [The Primary Patient: Maria Rodriguez](#the-primary-patient-maria-rodriguez)
- [The Clinical Setting](#the-clinical-setting)

---

## Part I: Patient Access & Registration

### [Chapter 1: The Patient Arrives](#chapter-1-the-patient-arrives)
- [1.1 Clinical Narrative](#11-clinical-narrative)
- [1.2 EHR Data Population](#12-ehr-data-population)
- [1.3 Standards & Ontology Mapping](#13-standards-ontology-mapping)
- [1.4 Cohort Design & Phenotyping](#14-cohort-design-phenotyping)
- [1.5 Technology Solution Layer](#15-technology-solution-layer)
- [1.6 Chapter 1 Mindmap](#16-chapter-1-mindmap-patient-registration-workflow)
- [1.7 Chapter 1 Summary](#17-chapter-summary-key-takeaways)
- [1.8 Interesting Facts](#18-interesting-facts)
- [1.9 References & Sources](#19-references-sources)

---

## Part II: Clinical Documentation & Diagnosis

### [Chapter 2: The Clinical Encounter & Documentation](#chapter-2-the-clinical-encounter-documentation)
- [2.1 Clinical Narrative](#21-clinical-narrative)
- [2.2 EHR Data Population](#22-ehr-data-population)
- [2.3 Clinical Terminology Mapping](#23-clinical-terminology-mapping)
- [2.4 OMOP CDM Mapping](#24-omop-cdm-mapping)
- [2.5 Cohort Design & Phenotyping](#25-cohort-design-phenotyping)
- [2.6 Chapter 2 Mindmap](#26-chapter-2-mindmap-clinical-encounter-workflow)
- [2.7 Chapter 2 Summary](#27-chapter-summary-key-takeaways)
- [2.8 Interesting Facts](#28-interesting-facts)
- [2.9 References & Sources](#29-references-sources)

### [Chapter 3: Diagnostic Workup & Orders](#chapter-3-diagnostic-workup-orders)
- [3.1 Clinical Narrative](#31-clinical-narrative)
- [3.2 Lab Results Return](#32-lab-results-return)
- [3.3 LOINC Deep Dive](#33-loinc-deep-dive)
- [3.4 FHIR Diagnostic Report](#34-fhir-diagnostic-report)
- [3.5 OMOP CDM Mapping](#35-omop-cdm-mapping)
- [3.6 Chapter 3 Mindmap](#36-chapter-3-mindmap-diagnostic-workup-workflow)
- [3.7 Chapter 3 Summary](#37-chapter-summary-key-takeaways)
- [3.8 Interesting Facts](#38-interesting-facts)
- [3.9 References & Sources](#39-references-sources)

---

## Part III: Care Coordination & Treatment

### [Chapter 4: Specialty Referral & Care Coordination](#chapter-4-specialty-referral-care-coordination)
- [4.1 Clinical Narrative](#41-clinical-narrative)
- [4.2 Care Coordination Documentation](#42-care-coordination-documentation)
- [4.3 Provider Perspective](#43-provider-perspective)
- [4.4 Chapter 4 Mindmap](#44-chapter-4-mindmap-care-coordination)
- [4.5 Chapter 4 Summary](#45-chapter-4-summary)
- [4.6 Interesting Facts](#46-interesting-facts)
- [4.7 References & Sources](#47-references-sources)

### [Chapter 5: Medication Management & Pharmacovigilance](#chapter-5-medication-management-pharmacovigilance)
- [5.1 Clinical Narrative](#51-clinical-narrative)
- [5.2 RxNorm Hierarchy](#52-rxnorm-hierarchy)
- [5.3 OMOP Drug Exposure](#53-omop-drug-exposure)
- [5.4 Pharmacovigilance Monitoring](#54-pharmacovigilance-monitoring)
- [5.5 Chapter 5 Mindmap](#55-chapter-5-mindmap-medication-management)
- [5.6 Chapter 5 Summary](#56-chapter-5-summary)
- [5.7 Interesting Facts](#57-interesting-facts)
- [5.8 References & Sources](#58-references-sources)

---

## Part IV: Clinical Intelligence & Quality

### [Chapter 6: Clinical Decision Support & Risk Stratification](#chapter-6-clinical-decision-support-risk-stratification)
- [6.1 Clinical Narrative](#61-clinical-narrative)
- [6.2 Risk Scores Implementation](#62-risk-scores-implementation)
- [6.3 Chapter 6 Summary](#63-chapter-6-summary)
- [6.4 Interesting Facts](#64-interesting-facts)
- [6.5 References & Sources](#65-references-sources)

### [Chapter 7: Quality Measurement & Population Health](#chapter-7-quality-measurement-population-health)
- [7.1 Clinical Narrative](#71-clinical-narrative)
- [7.2 HEDIS Quality Measure Implementation](#72-hedis-quality-measure-implementation)
- [7.3 Chapter 7 Summary](#73-chapter-7-summary)
- [7.4 Interesting Facts](#74-interesting-facts)
- [7.5 References & Sources](#75-references-sources)

---

## Part V: Operations & Outcomes

### [Chapter 8: Billing, Coding & Revenue Cycle](#chapter-8-billing-coding-revenue-cycle)
- [8.1 Clinical Narrative](#81-clinical-narrative)
- [8.2 Complete Billing Ontology Reference](#82-complete-billing-ontology-reference)
- [8.3 Claims Generation](#83-claims-generation)
- [8.4 Chapter 8 Summary](#84-chapter-8-summary)
- [8.5 Interesting Facts](#85-interesting-facts)
- [8.6 References & Sources](#86-references-sources)

### [Chapter 9: Care Transitions & Discharge](#chapter-9-care-transitions-discharge)
- [9.1 Clinical Narrative](#91-clinical-narrative)
- [9.2 Discharge Summary](#92-discharge-summary)
- [9.3 Chapter 9 Summary](#93-chapter-9-summary)
- [9.4 Interesting Facts](#94-interesting-facts)
- [9.5 References & Sources](#95-references-sources)

### [Chapter 10: Outcomes, Research & Continuous Improvement](#chapter-10-outcomes-research-continuous-improvement)
- [10.1 Six-Month Follow-Up](#101-six-month-follow-up)
- [10.2 Patient-Level Prediction](#102-patient-level-prediction)
- [10.3 Research Applications](#103-research-applications)
- [10.4 Lessons Learned: Maria's Journey](#104-lessons-learned-marias-journey)
- [10.5 Chapter 10 Summary](#105-chapter-10-summary)
- [10.6 Interesting Facts](#106-interesting-facts)
- [10.7 References & Sources](#107-references-sources)

---

## Appendices

- [Appendix A: Complete Terminology Reference](#appendix-a-complete-terminology-reference)
  - [A.1 ICD-10-CM Structure](#a1-icd-10-cm-structure)
  - [A.2 CPT Code Categories](#a2-cpt-code-categories)
  - [A.3 LOINC Code Axes](#a3-loinc-code-axes)
- [Appendix B: FHIR Resource Mapping Guide](#appendix-b-fhir-resource-mapping-guide)
  - [B.1 Core Clinical Resources](#b1-core-clinical-resources)
  - [B.2 HL7 v2 to FHIR Mapping](#b2-hl7-v2-to-fhir-mapping)
- [Appendix C: OMOP CDM Quick Reference](#appendix-c-omop-cdm-quick-reference)
  - [C.1 Clinical Data Tables](#c1-clinical-data-tables)
  - [C.2 Vocabulary Tables](#c2-vocabulary-tables)
- [Appendix D: Billing Code Crosswalk](#appendix-d-billing-code-crosswalk)
  - [D.1 Diagnosis Mapping](#d1-diagnosis-mapping-icd-10-to-snomed-to-omop)
  - [D.2 Procedure Mapping](#d2-procedure-mapping-cpt-to-snomed-to-omop)

---

## Back Matter

- [Glossary of Terms](#glossary-of-terms)
- [Index](#index)
- [About the Author](#about-the-author)

---

<div style="page-break-after: always;"></div>

---

# List of Tables

| Table # | Title | Chapter | Section |
|:-------:|:------|:-------:|:--------|
| **Table 1.1** | Patient Demographics Data Elements | Ch. 1 | [§1.3 Standards & Ontology](#13-standards-ontology-mapping) |
| **Table 1.2** | Insurance Eligibility Response (270/271) | Ch. 1 | [§1.3 Standards & Ontology](#13-standards-ontology-mapping) |
| **Table 1.3** | Master Patient Index Fields | Ch. 1 | [§1.4 Cohort Design](#14-cohort-design-phenotyping) |
| **Table 1.4** | OMOP Person Table Mapping | Ch. 1 | [§1.4 Cohort Design](#14-cohort-design-phenotyping) |
| **Table 2.1** | Vital Signs with LOINC Codes | Ch. 2 | [§2.3 Terminology Mapping](#23-clinical-terminology-mapping) |
| **Table 2.2** | ICD-10-CM to SNOMED CT Mapping | Ch. 2 | [§2.3 Terminology Mapping](#23-clinical-terminology-mapping) |
| **Table 2.3** | OMOP Condition Occurrence Fields | Ch. 2 | [§2.4 OMOP CDM Mapping](#24-omop-cdm-mapping) |
| **Table 3.1** | Laboratory Tests Ordered | Ch. 3 | [§3.1 Clinical Narrative](#31-clinical-narrative) |
| **Table 3.2** | LOINC Panel Components | Ch. 3 | [§3.3 LOINC Deep Dive](#33-loinc-deep-dive) |
| **Table 3.3** | Lab Results with Reference Ranges | Ch. 3 | [§3.2 Lab Results Return](#32-lab-results-return) |
| **Table 4.1** | Referral Documentation Elements | Ch. 4 | [§4.1 Clinical Narrative](#41-clinical-narrative) |
| **Table 4.2** | Care Coordination Checklist | Ch. 4 | [§4.2 Care Coordination](#42-care-coordination-documentation) |
| **Table 5.1** | Medication List with RxNorm Codes | Ch. 5 | [§5.1 Clinical Narrative](#51-clinical-narrative) |
| **Table 5.2** | Drug Interaction Severity Levels | Ch. 5 | [§5.4 Pharmacovigilance](#54-pharmacovigilance-monitoring) |
| **Table 5.3** | OMOP Drug Exposure Fields | Ch. 5 | [§5.3 OMOP Drug Exposure](#53-omop-drug-exposure) |
| **Table 6.1** | CHA₂DS₂-VASc Score Components | Ch. 6 | [§6.1 Clinical Narrative](#61-clinical-narrative) |
| **Table 6.2** | HAS-BLED Score Components | Ch. 6 | [§6.1 Clinical Narrative](#61-clinical-narrative) |
| **Table 6.3** | Maria's Risk Stratification Results | Ch. 6 | [§6.2 Risk Scores](#62-risk-scores-implementation) |
| **Table 7.1** | HEDIS Blood Pressure Control Measure | Ch. 7 | [§7.2 HEDIS Quality Measure](#72-hedis-quality-measure-implementation) |
| **Table 7.2** | Quality Gap Analysis | Ch. 7 | [§7.2 HEDIS Quality Measure](#72-hedis-quality-measure-implementation) |
| **Table 8.1** | CPT Codes for Maria's Encounters | Ch. 8 | [§8.2 Billing Ontology](#82-complete-billing-ontology-reference) |
| **Table 8.2** | ICD-10-CM Diagnosis Codes | Ch. 8 | [§8.2 Billing Ontology](#82-complete-billing-ontology-reference) |
| **Table 8.3** | Revenue Cycle Summary | Ch. 8 | [§8.3 Claims Generation](#83-claims-generation) |
| **Table 9.1** | Discharge Medication Reconciliation | Ch. 9 | [§9.2 Discharge Summary](#92-discharge-summary) |
| **Table 10.1** | Six-Month Outcome Metrics | Ch. 10 | [§10.1 Six-Month Follow-Up](#101-six-month-follow-up) |
| **Table 10.2** | OMOP Cohort Definition | Ch. 10 | [§10.2 Patient-Level Prediction](#102-patient-level-prediction) |

---

# List of Figures

| Figure # | Title | Chapter | Section |
|:--------:|:------|:-------:|:--------|
| **Figure 1.1** | Patient Registration Workflow | Ch. 1 | [§1.2 EHR Data Population](#12-ehr-data-population) |
| **Figure 1.2** | Master Patient Index Architecture | Ch. 1 | [§1.3 Standards & Ontology](#13-standards-ontology-mapping) |
| **Figure 1.3** | FHIR Patient Resource Structure | Ch. 1 | [§1.2 EHR Data Population](#12-ehr-data-population) |
| **Figure 1.4** | Chapter 1 Concept Mindmap | Ch. 1 | [§1.6 Chapter 1 Mindmap](#16-chapter-1-mindmap-patient-registration-workflow) |
| **Figure 2.1** | Clinical Encounter Data Flow | Ch. 2 | [§2.2 EHR Data Population](#22-ehr-data-population) |
| **Figure 2.2** | Documentation to Structured Data | Ch. 2 | [§2.3 Terminology Mapping](#23-clinical-terminology-mapping) |
| **Figure 2.3** | Chapter 2 Concept Mindmap | Ch. 2 | [§2.6 Chapter 2 Mindmap](#26-chapter-2-mindmap-clinical-encounter-workflow) |
| **Figure 3.1** | Laboratory Order Workflow | Ch. 3 | [§3.1 Clinical Narrative](#31-clinical-narrative) |
| **Figure 3.2** | LOINC Code Structure Diagram | Ch. 3 | [§3.3 LOINC Deep Dive](#33-loinc-deep-dive) |
| **Figure 3.3** | Chapter 3 Concept Mindmap | Ch. 3 | [§3.6 Chapter 3 Mindmap](#36-chapter-3-mindmap-diagnostic-workup-workflow) |
| **Figure 4.1** | Referral Information Flow | Ch. 4 | [§4.2 Care Coordination](#42-care-coordination-documentation) |
| **Figure 4.2** | Chapter 4 Concept Mindmap | Ch. 4 | [§4.4 Chapter 4 Mindmap](#44-chapter-4-mindmap-care-coordination) |
| **Figure 5.1** | RxNorm Concept Hierarchy | Ch. 5 | [§5.2 RxNorm Hierarchy](#52-rxnorm-hierarchy) |
| **Figure 5.2** | Medication Safety Checks | Ch. 5 | [§5.4 Pharmacovigilance](#54-pharmacovigilance-monitoring) |
| **Figure 5.3** | Chapter 5 Concept Mindmap | Ch. 5 | [§5.5 Chapter 5 Mindmap](#55-chapter-5-mindmap-medication-management) |
| **Figure 6.1** | CDS Alert Workflow | Ch. 6 | [§6.2 Risk Scores](#62-risk-scores-implementation) |
| **Figure 6.2** | Risk Score Calculation Flow | Ch. 6 | [§6.2 Risk Scores](#62-risk-scores-implementation) |
| **Figure 7.1** | Quality Measure Calculation | Ch. 7 | [§7.2 HEDIS Quality Measure](#72-hedis-quality-measure-implementation) |
| **Figure 7.2** | Population Health Dashboard | Ch. 7 | [§7.2 HEDIS Quality Measure](#72-hedis-quality-measure-implementation) |
| **Figure 8.1** | Revenue Cycle Flow | Ch. 8 | [§8.1 Clinical Narrative](#81-clinical-narrative) |
| **Figure 8.2** | Claims Adjudication Process | Ch. 8 | [§8.3 Claims Generation](#83-claims-generation) |
| **Figure 9.1** | Care Transition Workflow | Ch. 9 | [§9.1 Clinical Narrative](#91-clinical-narrative) |
| **Figure 10.1** | Patient-Level Prediction Pipeline | Ch. 10 | [§10.2 Patient-Level Prediction](#102-patient-level-prediction) |
| **Figure 10.2** | OHDSI Network Data Flow | Ch. 10 | [§10.3 Research Applications](#103-research-applications) |

---

<div style="page-break-after: always;"></div>

---

# Front Matter

## Preface

Healthcare data tells a story—but understanding that story requires bridging two worlds that too often speak past each other: the world of clinical practice and the world of healthcare technology.

Consider a typical clinical scenario: It's 2:47 AM in a cardiac step-down unit. A patient, admitted three days earlier for diabetes management, suddenly develops atrial fibrillation with rapid ventricular response. Her heart rate jumps from a steady 78 to an erratic 142. The rapid response team arrives. The hospitalist orders rate control medications. The pharmacist verifies dosing. The cardiologist is paged. Orders fly into the electronic health record.

Every keystroke made that night follows this patient for the rest of her life. The diagnosis code selected (I48.91 for atrial fibrillation) determines her insurance coverage for anticoagulation. The vital signs recorded train future algorithms to predict similar events in other patients. The medication reconciliation is transmitted to her pharmacy, her primary care doctor, and quality databases measuring hospital performance.

This moment captures the essence of clinical informatics: where clinical care meets data architecture, where a physician's judgment becomes a coded concept, where a patient's story transforms into rows in a database.

---

### Why This Book

Technical documentation teaches *what* the standards are—the structure of a FHIR Patient resource, the fields in an HL7 ADT message, the tables in the OMOP CDM. But it rarely teaches *why* these structures exist or *how* they connect to actual patient care.

Clinical textbooks teach pathophysiology and treatment protocols. But they rarely explain how clinical knowledge becomes structured data or why documentation choices have downstream consequences.

This book fills that gap.

**For clinical data scientists**, this text provides the clinical context that gives meaning to datasets. When querying the CONDITION_OCCURRENCE table and finding concept_id 313217, readers will understand not just that this represents "atrial fibrillation," but why the cardiologist chose this particular diagnosis, how it changes the patient's care trajectory, and what billing implications cascade from this single clinical decision.

**For informatics students**, these chapters demonstrate how daily clinical documentation flows through HL7 interfaces, transforms into FHIR resources, and ultimately enables research that improves care for millions of patients.

**For software engineers entering healthcare**, this book explains why the industry cannot simply "move fast and break things"—because in healthcare, broken systems mean compromised patient safety.

---

### The Information Bridge

Clinical informatics occupies a unique crossroads. Informaticists serve as translators, interpreters, and bridge-builders. They take the messy, complex, often contradictory reality of patient care and render it into structured data. They take the sterile rows and columns of databases and breathe clinical meaning back into them.

Consider what happens when a physician documents a new atrial fibrillation diagnosis:

**From the clinical perspective:** The physician records clinical reasoning—observing an irregularly irregular pulse, confirming with a 12-lead EKG, assessing stroke risk using the CHA₂DS₂-VASc score, and formulating a treatment plan. The documentation tells a story of diagnostic reasoning and clinical decision-making.

**From the technical perspective:** This documentation triggers a cascade of discrete data elements. The diagnosis becomes an ICD-10-CM code (I48.91) for billing, a SNOMED CT concept (49436004) for clinical interoperability, and an OMOP concept_id (313217) for research. Medication orders generate RxNorm codes, lab orders generate LOINC codes, and procedure orders generate CPT codes.

**From the operational perspective:** This single clinical decision initiates prior authorization requests, quality measure calculations, risk adjustment algorithms, and population health stratification. It changes the patient's predicted readmission risk, eligibility for disease management programs, and pharmacy benefit coverage.

Understanding clinical informatics means viewing all three perspectives simultaneously—the clinical story, the data architecture, and the operational workflow as facets of a single reality.

---

### About This Book

Each chapter follows a single patient—Maria Rodriguez—through a complete care journey, from her first phone call to schedule an appointment through her diagnosis, treatment, and long-term outcomes. Along the way, these chapters examine:

- **The clinical workflow:** What actually happens at each stage of care?
- **The clinical documentation:** What notes, orders, and forms are generated?
- **The data architecture:** How does this documentation become structured data?
- **The standards mapping:** How are clinical concepts translated into standardized terminologies?
- **The downstream implications:** How does this data enable research, quality measurement, and population health?

Each chapter follows a consistent structure:

1. **Clinical Narrative:** A detailed, realistic portrayal of the clinical workflow, including dialogue, clinical reasoning, and documentation examples
2. **EHR Data Population:** How the clinical events translate into structured data
3. **Standards & Ontology Mapping:** How clinical concepts map to ICD-10, CPT, LOINC, SNOMED CT, RxNorm, and other terminologies
4. **Cohort Design & Phenotyping:** How this data supports research and population health
5. **Technology Solution Layer:** Code examples, FHIR resources, and implementation patterns
6. **Mindmap:** A visual representation of the chapter's key concepts and relationships

The appendices provide quick reference guides to terminology systems, FHIR resources, the OMOP CDM, and billing code crosswalks.

By the end of this book, readers will be able to trace any piece of healthcare data from its origin at the patient bedside to its ultimate use in research, operations, and quality improvement. The goal is understanding not just what the data *is*, but what it *means*.

---

### Acknowledgments

Maria Rodriguez is a composite fictional character, but her story reflects the real experiences of countless patients. This book is dedicated to the informaticists, data scientists, and healthcare technologists who work tirelessly to transform clinical data into insights that improve patient care.

This book is for everyone who has ever asked, "But what does that code actually *mean*?"

The exploration begins here.

*Clinical AI Insider*
*January 2026*

---

## How to Use This Book

### Reading Pathways

**For Clinical Data Scientists:**
Start with Chapters 1-3 for foundational clinical workflow understanding, then focus on Chapters 6-7 for CDS and quality measurement applications. Chapter 10 addresses research methodology and patient-level prediction.

**For Health IT Professionals:**
The technical implementation details are distributed throughout, but pay special attention to the "EHR Data Population" and "Technology Solution Layer" sections in each chapter. Appendix B provides the FHIR mapping guide.

**For Software Engineers New to Healthcare:**
Read linearly to build context, but keep Appendix A (Terminology Reference) open throughout. Healthcare has its own vocabulary, and understanding clinical terms is essential for meaningful development work.

**For Nursing Informatics Students:**
The clinical narratives will feel familiar. Focus on how daily documentation decisions translate into downstream data structures. Chapter 8 on billing is particularly important for understanding the revenue cycle implications of clinical documentation.

### Chapter Dependencies

![Chapter Dependencies Workflow](../assets/infographics/02_chapter_dependencies.svg)

*Figure: Textbook Learning Path — showing chapter progression and dependencies*

### Conventions Used in This Book

**Clinical Documentation Examples** appear in formatted blocks:
```
PROGRESS NOTE
Date: 2026-01-15
Patient: Rodriguez, Maria
...
```

**Code Examples** are syntax-highlighted:
```python
async def get_patient(patient_id: str) -> Patient:
    """Fetch patient from FHIR server."""
    response = await client.get(f"/Patient/{patient_id}")
    return Patient.parse_obj(response.json())
```

**Terminology Mappings** appear in tables:
| Clinical Concept | ICD-10-CM | SNOMED CT | OMOP Concept ID |
|-----------------|-----------|-----------|-----------------|
| Atrial fibrillation | I48.91 | 49436004 | 313217 |

**Provider Perspectives** are quoted and attributed:
> "Registration isn't just administrative paperwork—it's the foundation of the patient's entire care journey."
> — Jennifer Torres, MSN, RN-BC

**Key Concepts** are highlighted in callout boxes throughout the text.

---

## Meet the Clinical Team

### Primary Narrator

**Jennifer Torres, MSN, RN-BC**
*Nurse Informaticist, Community Health Clinic*

Jennifer brings 12 years of clinical nursing experience and 5 years in informatics. She holds board certification in Nursing Informatics from the American Nurses Credentialing Center (ANCC). Her role bridges clinical staff and IT, translating between clinical workflows and technical requirements.

**Background:**
- BSN from University of Illinois Chicago (2009)
- MSN in Nursing Informatics from Chamberlain University (2019)
- Started as floor nurse in cardiac step-down
- Transitioned to informatics after recognizing documentation burdens
- Currently leads EHR optimization and clinical decision support initiatives

**Perspective:** Jennifer views healthcare data as a clinical tool. Every data element should serve patient care—if it does not, the question must be asked why it is being collected.

---

### Clinical Providers

**Dr. Sarah Chen, MD**
*Family Medicine Physician*

Dr. Chen has practiced primary care for 15 years, the last 8 at Community Health Clinic. She serves as Maria's primary care provider and manages her chronic conditions.

**Clinical Focus:** Chronic disease management, preventive care, health maintenance
**EHR Usage:** Heavy user of problem lists, medication management, and care gap alerts
**Perspective:** "The EHR should help me see the whole patient, not just today's complaint."

---

**Dr. Michael Torres, MD, FACC**
*Cardiologist, Springfield Cardiology Associates*

Dr. Torres provides cardiology consultation services to CHC patients. He evaluated Maria for her new atrial fibrillation diagnosis.

**Clinical Focus:** Arrhythmia management, heart failure, preventive cardiology
**EHR Usage:** Relies heavily on consultation documentation, EKG interpretation, and echocardiography reports
**Perspective:** "Good data enables good decisions. When I can see a patient's complete cardiac history, I can make better recommendations."

---

**Dr. Amanda Williams, DO**
*Hospitalist, Springfield Memorial Hospital*

Dr. Williams manages inpatient care when CHC patients require hospitalization. She admitted Maria during an episode of AFib with rapid ventricular response.

**Clinical Focus:** Acute care management, care transitions, hospital medicine
**EHR Usage:** Admission documentation, discharge planning, handoff communication
**Perspective:** "The discharge summary is the most important document I write. It's the bridge between hospital and home."

---

**Dr. James Park, MD, FACS**
*General Surgeon, Springfield Surgical Associates*

Dr. Park provides surgical consultation when needed. While Maria's case does not require surgery, his perspective informs Chapter 4 on specialty referrals.

**Clinical Focus:** General surgery, surgical risk assessment, perioperative optimization
**EHR Usage:** Operative reports, surgical history review, pre-operative assessment
**Perspective:** "Every patient I operate on has a story written in their medical record. My job is to read that story carefully before I make a single incision."

---

### Care Team Members

**Lisa Brown, RN, BSN**
*Care Coordinator*

Lisa manages care transitions and coordinates services for complex patients like Maria. She ensures continuity between settings and providers.

**Role:** Patient education, care plan coordination, transition management
**EHR Usage:** Care plans, referral tracking, patient outreach documentation
**Perspective:** "I'm the glue that holds the care team together. When communication breaks down, patients fall through the cracks."

---

**Jessica Martinez, PharmD, BCPS**
*Clinical Pharmacist*

Jessica reviews medication orders, performs reconciliation, and counsels patients on drug therapy. She plays a critical role in Maria's anticoagulation management.

**Role:** Medication therapy management, drug interaction screening, patient counseling
**EHR Usage:** Medication lists, allergy checking, drug-drug interaction alerts
**Perspective:** "Every medication has the potential to help or harm. My job is to maximize the help and minimize the harm."

---

### Administrative Staff

**Sarah Johnson, MPH**
*Quality Director*

Sarah oversees quality measurement, HEDIS reporting, and value-based care programs. She translates clinical data into performance metrics.

**Role:** Quality measure calculation, performance improvement, regulatory reporting
**EHR Usage:** Population health dashboards, quality gap reports, registry management
**Perspective:** "Behind every quality metric is a patient who did or didn't receive the care they needed. Numbers tell stories."

---

**Tom Richards**
*Revenue Cycle Manager*

Tom manages billing operations, claims submission, and coding compliance. He ensures clinical documentation supports appropriate reimbursement.

**Role:** Claims processing, coding accuracy, denial management
**EHR Usage:** Charge capture, coding queues, claims status tracking
**Perspective:** "Good clinical documentation is good financial documentation. When providers document clearly, billing follows naturally."

---

**Karen Williams**
*Front Desk Supervisor*

Karen oversees patient registration, scheduling, and front-desk operations. She is often the first point of contact for patients like Maria.

**Role:** Patient registration, appointment scheduling, insurance verification
**EHR Usage:** Registration screens, scheduling modules, eligibility checking
**Perspective:** "Every patient interaction starts with us. We set the tone for the entire visit."

---

## The Primary Patient: Maria Rodriguez

**Demographics:**
- **Age:** 46 years old
- **Gender:** Female
- **Occupation:** Elementary school teacher
- **Residence:** Springfield, Illinois
- **Insurance:** Illinois Medicaid (Managed Care)
- **Primary Language:** English (bilingual Spanish)

**Medical History:**
- Type 2 Diabetes Mellitus (diagnosed 3 years ago)
- Essential Hypertension (diagnosed 5 years ago)
- Obesity (BMI 32.1)

**New Diagnosis (discovered during our story):**
- Atrial Fibrillation (paroxysmal)

**Social History:**
- Single mother of two children (ages 12 and 16)
- Non-smoker, occasional social alcohol
- Active lifestyle despite work demands
- Strong family support system

**Why Maria?**

Maria represents millions of Americans navigating a complex healthcare system while managing chronic conditions. Her story illustrates:

- **Chronic disease management:** How ongoing conditions like diabetes and hypertension generate continuous data streams
- **Acute care episodes:** How new diagnoses like atrial fibrillation disrupt routine care
- **Care coordination challenges:** How multiple providers must share information
- **Socioeconomic realities:** How insurance status affects access and documentation
- **Health equity considerations:** How safety-net providers serve vulnerable populations

Throughout this book, Maria's journey demonstrates how clinical care generates data, how that data flows through healthcare information systems, and how it ultimately enables research, quality improvement, and better care for future patients.

---

## The Clinical Setting

*Note: The healthcare organization described in this book is entirely fictional, created to demonstrate realistic clinical informatics concepts.*

**Organization Profile:**
- **Type:** Federally Qualified Health Center (FQHC)
- **Locations:** 3 clinic sites
- **Patient Population:** 15,000 active patients
- **Payer Mix:** 60% Medicaid, 20% Uninsured (sliding fee), 15% Medicare, 5% Commercial
- **Services:** Primary care, behavioral health, dental, pharmacy, care coordination

**Technology Infrastructure:**
- **EHR System:** Modern cloud-based EHR with FHIR R4 API
- **Health Information Exchange:** Connected to regional HIE
- **Practice Management:** Integrated scheduling and billing modules
- **Patient Portal:** Active patient engagement platform
- **Analytics:** Population health dashboards and quality reporting

**Quality Programs:**
- HRSA Uniform Data System (UDS) reporting
- CMS Quality Payment Program (MIPS)
- NCQA Patient-Centered Medical Home recognition
- State Medicaid managed care quality incentives

**Research Participation:**
- OHDSI network node (contributes de-identified data)
- PCORnet clinical data research network
- Academic partnerships for health services research

This setting provides a realistic context for understanding healthcare informatics. FQHCs operate under unique regulatory requirements, serve diverse populations, and must maximize the value of every dollar. Their technology decisions directly impact patient care, financial sustainability, and community health outcomes.

---

# Part I: Patient Access & Registration

# Chapter 1: The Patient Arrives

## 1.1 Clinical Narrative

### Monday, January 13, 2026 — 8:15 AM

The phone at Community Health Clinic's front desk rang for what must have been the twentieth time that morning. Karen Williams, the front desk supervisor, picked it up while simultaneously waving to a patient who had just arrived for an 8:30 appointment.

"Community Health Clinic, this is Karen. How can I help you?"

"Hi, um, I need to make an appointment." The voice on the other end sounded tired. "I'm not feeling well. My blood sugars have been really high lately, and I've been so exhausted I can barely make it through the day."

Karen pulled up the scheduling system. "Of course, I can help you with that. Are you an existing patient here?"

"Yes, I've been coming there for about three years. Maria Rodriguez."

Karen typed the name into the search field. The Master Patient Index returned a match: Maria Rodriguez, DOB 03/15/1979, MRN 12345. The record showed she was established with Dr. Sarah Chen for primary care, with last visit dates, active problems, and insurance information all populating on the screen.

"I found you, Ms. Rodriguez. I see you're due for your diabetes check-up anyway—your last visit was about four months ago. Let me see what Dr. Chen has available."

Karen navigated to the scheduling module. Dr. Chen's template showed her availability: a mix of acute visits (15 minutes), routine follow-ups (20 minutes), and comprehensive visits (40 minutes). Given Maria's symptoms—fatigue and elevated blood sugars in a diabetic patient—this would need at least a routine slot.

"I can get you in this Wednesday at 9:00 AM with Dr. Chen. Would that work?"

"Wednesday? That's two days away. I was hoping for something sooner..." Maria's voice trailed off.

Karen considered the situation. Elevated blood sugars and fatigue could be simple—maybe Maria had been eating differently during the holidays, or stress from work was affecting her control. But it could also signal something more serious. She pulled up the nurse triage protocol on her secondary screen.

"Ms. Rodriguez, I want to make sure we get you the right appointment. Can I ask you a few more questions? Are you having any chest pain, shortness of breath, or confusion?"

"No, nothing like that. Just really tired. And my heart has been doing this weird fluttering thing for the past week or so."

Karen's clinical training kicked in. Heart palpitations in a diabetic patient warranted closer attention. She flagged the appointment request and sent an instant message to Lisa Brown, the care coordinator, summarizing the symptoms.

Within two minutes, Lisa appeared at the front desk. She picked up the phone. "Ms. Rodriguez? This is Lisa Brown, I'm a nurse here at the clinic. Karen told me about your symptoms. The heart fluttering you're describing—can you tell me more about that?"

Maria described intermittent episodes of her heart "jumping around," sometimes accompanied by mild lightheadedness. No syncope. No chest pain. Episodes lasting minutes to hours.

Lisa's mental differential included benign palpitations from caffeine or stress, but also arrhythmias like atrial fibrillation—particularly concerning in a patient with diabetes and hypertension, both risk factors for AFib. The combination of new palpitations and fatigue in this population warranted same-day evaluation.

"I want to see you today, Ms. Rodriguez. Can you come in at 11:30? We'll work you into Dr. Chen's schedule."

---

### 11:15 AM — Patient Arrival

Maria Rodriguez walked through the front doors of Community Health Clinic, her Medicaid card and driver's license already in hand. The waiting room was about half full—a mix of young mothers with children, elderly patients with walkers, and working-age adults who had probably taken time off their jobs to be here.

Karen greeted her with a warm smile. "Ms. Rodriguez? Thanks for coming in. Let me just verify a few things."

**Identity Verification Protocol:**

Karen followed the standard registration verification process—a choreographed routine designed to ensure patient safety and data integrity:

1. **Photo ID Check:** Maria's Illinois driver's license confirmed her identity. Karen compared the photo to the person standing before her.

2. **Date of Birth Verification:** "Can you confirm your date of birth for me?"
   "March 15, 1979."

3. **Address Confirmation:** "And you're still at 123 Main Street?"
   "Yes, same place."

4. **Insurance Verification:** Karen swiped Maria's Medicaid card through the eligibility verification system. Within seconds, the 270/271 transaction returned: ELIGIBLE, Coverage Active, Meridian Health Plan of Illinois.

5. **Emergency Contact Update:** "Is your emergency contact still your sister, Rosa?"
   "Yes, same number."

6. **Medication List Review:** Karen handed Maria a printed list of her medications from the last visit. "Can you look at this and let me know if anything has changed?"

Maria scanned the list:
- Metformin 500mg twice daily
- Lisinopril 20mg once daily

"That's right, but Dr. Chen was talking about increasing the Metformin. I don't think that happened yet."

Karen made a note for the nursing staff to verify current medications during intake.

---

**Pre-Visit Questionnaire:**

While Maria waited, she completed a tablet-based questionnaire that fed directly into the EHR:

```
PATIENT CHECK-IN QUESTIONNAIRE
Date: 01/13/2026
Patient: Rodriguez, Maria
MRN: 12345

CHIEF COMPLAINT (select all that apply):
[X] Fatigue/tiredness
[X] Heart palpitations
[ ] Chest pain
[ ] Shortness of breath
[X] Blood sugar concerns
[ ] Other: _______________

SYMPTOM DURATION:
[X] 1-2 weeks
[ ] 2-4 weeks
[ ] More than 4 weeks

SEVERITY (1-10): 6

ADDITIONAL CONCERNS:
"My blood sugars have been running 180-220 when I check in the
morning. Usually they're around 130-140. I've been really tired and
my heart keeps doing this jumping thing."

MEDICATION ADHERENCE:
"Have you missed any doses of your medications in the past week?"
[ ] No
[X] Yes - describe: "I sometimes forget the evening Metformin"

ALLERGIES (confirm):
[ ] No known allergies - CONFIRMED
[ ] Changes to allergy list: _______________
```

The questionnaire responses flowed into Maria's chart as structured data, populating the chief complaint field and pre-loading information for the nursing assessment.

---

### The Data Behind Registration

What Maria experienced as a simple phone call and check-in process generated a remarkable cascade of data events. The following section describes what actually happened within the clinic's systems.

**Master Patient Index (MPI):**

When Karen searched for "Maria Rodriguez," the system queried the Master Patient Index—a specialized database designed to uniquely identify patients across all encounters and locations. The MPI uses probabilistic matching algorithms to find patients even when information varies slightly.

The MPI search algorithm considers:
- Full name (weighted heavily)
- Date of birth (weighted heavily)
- Social Security Number (if available)
- Address components
- Phone number
- Previous MRNs or aliases

In Maria's case, the match was straightforward—an exact match on name and DOB with a previously assigned MRN. But consider a more complex scenario: What if Maria had gotten married and changed her last name? What if she had given a slightly different birthdate? What if she had been seen at another clinic location under a different registration?

**Why This Matters:**

Duplicate patient records are one of the most dangerous forms of data corruption in healthcare. When a patient has multiple records:
- Medication allergies might be documented in one record but not another
- Critical diagnoses might be fragmented across records
- Lab results might not be visible to all providers
- Duplicate testing might occur, wasting resources and exposing patients to unnecessary risk

The MPI maintains a match threshold of 85%—below that, a human reviewer must verify identity. Above 85%, the system automatically links records. At exactly 85%, a "potential duplicate" flag generates for later review.

---

**Real-Time Eligibility Verification:**

When Karen swiped Maria's Medicaid card, she initiated an X12 270/271 transaction—an electronic eligibility inquiry that follows a strict EDI (Electronic Data Interchange) standard.

**The 270 Request (what was sent):**
- Subscriber ID (Maria's Medicaid number)
- Date of service (today's date)
- Service type requested (professional visit)
- Provider NPI (the clinic's identifier)

**The 271 Response (what was received):**
- Eligibility status: ACTIVE
- Coverage dates: 01/01/2025 - 12/31/2026
- Plan name: Meridian Health Plan of Illinois
- Copay amount: $0 (Medicaid)
- Prior authorization requirements: None for primary care
- Remaining deductible: N/A

This transaction completed in under 3 seconds. Before electronic eligibility verification, front desk staff would call insurance companies, wait on hold, and manually record coverage information—a process that could take 15-20 minutes per patient. Today, clinics verify hundreds of patients per day in real-time.

But the eligibility response is not merely administrative information—it is clinical data as well. The coverage status indicates:
- Whether Maria can afford her medications (crucial for adherence)
- What specialists she can see (Medicaid networks are limited)
- What prior authorizations will be needed for tests or procedures
- How documentation must be structured to support billing

**Insurance as a Social Determinant of Health:**

Maria's Medicaid status identifies her as a member of a vulnerable population. Medicaid patients face documented barriers to care:
- Fewer specialists accept Medicaid
- Appointment wait times are often longer
- Some medications require prior authorization
- Care coordination resources may be limited

The EHR automatically flags Medicaid patients for enhanced care coordination services—not because they receive different clinical treatment, but because they may need additional support navigating the healthcare system.

---

### Provider Perspective: The Nurse Informaticist

> "Registration isn't just administrative paperwork—it's the foundation of the patient's entire care journey. Every field we capture has downstream clinical implications. A wrong date of birth can cause medication dosing errors in pediatric or geriatric patients. An outdated address means outreach letters go to the wrong place. An incorrect insurance can delay critical authorizations.
>
> I've seen patients harmed because we didn't capture accurate data at the front door. A patient whose allergy list didn't transfer from a previous visit. A patient whose prior records weren't linked because of a data entry error. A patient who didn't get a reminder call because their phone number was wrong.
>
> That's why I train our registration staff like clinical team members—because they are. The first data they enter follows the patient through every subsequent encounter."
>
> — Jennifer Torres, MSN, RN-BC

---

## 1.2 EHR Data Population

### The ADT Message

When Karen completed Maria's registration, the EHR generated an ADT (Admit/Discharge/Transfer) message—specifically an ADT^A04 message, indicating a new outpatient registration.

Here's what that message looks like in HL7 v2.5 format:

```
MSH|^~\&|CLINICEHR|CHC|INTENGINE|CHC|20260113113000||ADT^A04^ADT_A01|MSG001|P|2.5.1|||AL|NE|||||
EVN|A04|20260113113000|||KWILLIAMS^WILLIAMS^KAREN^^^^STAFF
PID|1||12345^^^CHC^MR~IL987654321^^^IL^MC||RODRIGUEZ^MARIA^^^^^L||19790315|F||2106-3^White^CDCREC|123 MAIN ST^^SPRINGFIELD^IL^62701^USA^H||^PRN^PH^^^217^5551234|^WPN^PH^^^217^5555678|ENG|M|CAT|987654321^^^CHC^AN|||2186-5^Not Hispanic or Latino^CDCREC||||||||N
PV1|1|O|CHC-MAIN^^^CHC^^^^^OUTPATIENT||||1234567890^CHEN^SARAH^^^^^MD^ATTENDING|||||||||||V20260113001|||||||||||||||||||||||||20260113113000||||||
IN1|1|MC^MEDICAID|IL-MERIDIAN|MERIDIAN HEALTH PLAN OF ILLINOIS||||||||20250101|20261231|||1|RODRIGUEZ^MARIA|SELF||||||||||||||||||IL987654321||||||SUBSCRIBER
PD1||||1234567890^CHEN^SARAH^^^^^MD
GT1|1||RODRIGUEZ^MARIA||123 MAIN ST^^SPRINGFIELD^IL^62701|||19790315|F
```

The key segments decode as follows:

**MSH (Message Header):**
- Sending application: CLINICEHR
- Sending facility: CHC
- Message type: ADT^A04 (Register a patient)
- Processing ID: P (Production)

**PID (Patient Identification):**
- MRN: 12345
- Medicaid ID: IL987654321
- Name: RODRIGUEZ, MARIA
- DOB: 03/15/1979
- Gender: Female
- Race: 2106-3 (White) - CDC Race code
- Ethnicity: 2186-5 (Not Hispanic or Latino)
- Address: 123 Main St, Springfield, IL 62701
- Language: English
- Marital Status: M (Married... note: this is actually incorrect—Maria is single. This data entry error will be discovered later.)

**PV1 (Patient Visit):**
- Patient class: O (Outpatient)
- Attending physician: Dr. Sarah Chen
- Visit number: V20260113001

**IN1 (Insurance):**
- Plan type: Medicaid
- Payer: Meridian Health Plan of Illinois
- Coverage dates: 01/01/2025 - 12/31/2026
- Subscriber: Self

---

<a id="figure-13-fhir-patient"></a>

### FHIR Resource Creation

The modern EHR simultaneously creates FHIR R4 resources that are exposed through the API and shared with the health information exchange:

**Patient Resource:**

```json
{
  "resourceType": "Patient",
  "id": "maria-rodriguez-12345",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2026-01-13T11:30:00.000Z",
    "source": "#registration-system"
  },
  "identifier": [
    {
      "use": "usual",
      "type": {
        "coding": [{
          "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code": "MR",
          "display": "Medical Record Number"
        }]
      },
      "system": "urn:oid:2.16.840.1.113883.19.5.1",
      "value": "12345"
    },
    {
      "use": "official",
      "type": {
        "coding": [{
          "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code": "MA",
          "display": "Medicaid number"
        }]
      },
      "system": "http://illinois.gov/medicaid",
      "value": "IL987654321"
    }
  ],
  "active": true,
  "name": [{
    "use": "official",
    "family": "Rodriguez",
    "given": ["Maria"]
  }],
  "telecom": [
    {
      "system": "phone",
      "value": "217-555-1234",
      "use": "home"
    },
    {
      "system": "phone",
      "value": "217-555-5678",
      "use": "work"
    }
  ],
  "gender": "female",
  "birthDate": "1979-03-15",
  "address": [{
    "use": "home",
    "type": "physical",
    "line": ["123 Main Street"],
    "city": "Springfield",
    "state": "IL",
    "postalCode": "62701",
    "country": "USA"
  }],
  "maritalStatus": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
      "code": "M",
      "display": "Married"
    }]
  },
  "communication": [{
    "language": {
      "coding": [{
        "system": "urn:ietf:bcp:47",
        "code": "en",
        "display": "English"
      }]
    },
    "preferred": true
  }],
  "extension": [
    {
      "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race",
      "extension": [{
        "url": "ombCategory",
        "valueCoding": {
          "system": "urn:oid:2.16.840.1.113883.6.238",
          "code": "2106-3",
          "display": "White"
        }
      }]
    },
    {
      "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity",
      "extension": [{
        "url": "ombCategory",
        "valueCoding": {
          "system": "urn:oid:2.16.840.1.113883.6.238",
          "code": "2186-5",
          "display": "Not Hispanic or Latino"
        }
      }]
    }
  ]
}
```

**Coverage Resource:**

```json
{
  "resourceType": "Coverage",
  "id": "coverage-maria-medicaid",
  "status": "active",
  "type": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "code": "SUBSIDMC",
      "display": "subsidized managed care program"
    }]
  },
  "subscriber": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "beneficiary": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "relationship": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/subscriber-relationship",
      "code": "self"
    }]
  },
  "period": {
    "start": "2025-01-01",
    "end": "2026-12-31"
  },
  "payor": [{
    "reference": "Organization/meridian-health-plan",
    "display": "Meridian Health Plan of Illinois"
  }],
  "class": [
    {
      "type": {
        "coding": [{
          "system": "http://terminology.hl7.org/CodeSystem/coverage-class",
          "code": "plan"
        }]
      },
      "value": "IL-MEDICAID-MC",
      "name": "Illinois Medicaid Managed Care"
    }
  ]
}
```

**Encounter Resource (Started at Check-in):**

```json
{
  "resourceType": "Encounter",
  "id": "encounter-20260113-maria",
  "status": "arrived",
  "class": {
    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code": "AMB",
    "display": "ambulatory"
  },
  "type": [{
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "185349003",
      "display": "Encounter for check up"
    }]
  }],
  "serviceType": {
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "394802001",
      "display": "General medicine"
    }]
  },
  "priority": {
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "394849002",
      "display": "High priority"
    }]
  },
  "subject": {
    "reference": "Patient/maria-rodriguez-12345",
    "display": "Maria Rodriguez"
  },
  "participant": [{
    "type": [{
      "coding": [{
        "system": "http://terminology.hl7.org/CodeSystem/v3-ParticipationType",
        "code": "ATND",
        "display": "attender"
      }]
    }],
    "individual": {
      "reference": "Practitioner/dr-sarah-chen",
      "display": "Dr. Sarah Chen, MD"
    }
  }],
  "period": {
    "start": "2026-01-13T11:30:00-06:00"
  },
  "reasonCode": [{
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "84229001",
      "display": "Fatigue"
    }],
    "text": "Fatigue, elevated blood sugars, heart palpitations"
  }],
  "serviceProvider": {
    "reference": "Organization/community-health-clinic",
    "display": "Community Health Clinic"
  }
}
```

---

## 1.3 Standards & Ontology Mapping

### Clinical Terminologies in Registration

The data captured during patient registration maps to multiple standard terminologies:

<a id="table-11-patient-demographics"></a>

**Table 1.1: Patient Demographics Data Elements**

| Data Element | Standard | Code | Description |
|--------------|----------|------|-------------|
| Race - White | CDC Race & Ethnicity | 2106-3 | Required for federal reporting |
| Ethnicity - Not Hispanic | CDC Race & Ethnicity | 2186-5 | Required for federal reporting |
| Language - English | ISO 639-1 | en | Primary communication language |
| Gender - Female | HL7 AdministrativeGender | female | Administrative gender identity |
| Marital Status - Married | HL7 v3 MaritalStatus | M | Social/legal status |
| Country - USA | ISO 3166-1 | USA | Address country code |
| State - Illinois | USPS State Codes | IL | Address state code |

**Why Multiple Terminologies?**

Each terminology serves a specific purpose:

- **CDC Race & Ethnicity codes** are required for federal quality reporting and health equity analysis
- **ISO 639 language codes** enable proper interpreter services and translated materials
- **HL7 value sets** ensure interoperability with other healthcare systems
- **USPS codes** enable address validation and geocoding

### Insurance Ontology

Healthcare payers are classified using a hierarchical ontology. The infographic below shows this classification along with terminology standards used in clinical informatics:

<a id="figure-12-mpi-architecture"></a>

![Terminology Standards and Healthcare Payers](../assets/infographics/05_terminology_standards.svg)

*Figure 1.2: Healthcare Terminology Standards — ICD-10-CM, CPT, LOINC structures, healthcare payer ontology, and provider order entry workflow*

Maria's coverage falls under **Medicaid Managed Care** (Government Programs → Medicaid).

Maria's Medicaid Managed Care coverage has specific implications:

<a id="table-12-insurance-eligibility"></a>

**Table 1.2: Insurance Eligibility Response (270/271)**

| Attribute | Value | Clinical Implication |
|-----------|-------|----------------------|
| Payer Type | Government - Medicaid | Safety net, limited network |
| Plan Model | Managed Care (MCO) | Requires network providers |
| Copay | $0 | No out-of-pocket for primary care |
| Prior Auth | Not required for PCP | No delay for routine visits |
| Specialist Referral | Required | Need referral for cardiology |
| Pharmacy Coverage | Preferred Drug List | May affect medication choice |

---

## 1.4 Cohort Design & Phenotyping

### Defining a Phenotype: New Patient Registration

In research and population health, cohorts of patients must often be identified. The following defines a phenotype for "newly registered patients" in the OMOP Common Data Model:

**Phenotype Definition:**

```yaml
Name: New Patient Registration
Version: 1.0
Author: CHC Informatics Team
Date: 2026-01-13

Description: |
  Identifies patients who registered for their first visit
  at Community Health Clinic within a specified time period.

Inclusion Criteria:
  1. First visit_occurrence at CHC
  2. visit_concept_id = 9202 (Outpatient Visit)
  3. visit_start_date within measurement period

Exclusion Criteria:
  1. Any prior visit_occurrence at CHC

Output Fields:
  - person_id
  - visit_occurrence_id
  - visit_start_date
  - gender
  - birth_datetime
  - race
  - ethnicity
```

**OMOP CDM SQL Query:**

```sql
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
FROM person p
INNER JOIN visit_occurrence v
    ON p.person_id = v.person_id
INNER JOIN concept gc
    ON p.gender_concept_id = gc.concept_id
INNER JOIN concept rc
    ON p.race_concept_id = rc.concept_id
INNER JOIN concept ec
    ON p.ethnicity_concept_id = ec.concept_id
INNER JOIN concept vc
    ON v.visit_concept_id = vc.concept_id
LEFT JOIN care_site cs
    ON v.care_site_id = cs.care_site_id
WHERE v.visit_concept_id = 9202  -- Outpatient Visit
    AND v.visit_start_date BETWEEN '2026-01-01' AND '2026-01-31'
    AND NOT EXISTS (
        -- Exclude patients with prior visits
        SELECT 1
        FROM visit_occurrence v_prior
        WHERE v_prior.person_id = p.person_id
            AND v_prior.visit_start_date < v.visit_start_date
    )
ORDER BY v.visit_start_date;
```

**Live Query Results from OMOP CDM:**

When this query is executed against the teaching database with Maria Rodriguez's data, the following results are returned:

<div align="center">

<a id="table-13-mpi-fields"></a>

**Table 1.3: Master Patient Index Fields**

**QUERY: Patient Demographics from OMOP CDM (person table)**

| person_id | mrn | year_of_birth | age | gender | race | ethnicity |
|:---------:|:--------:|:-------------:|:---:|:------:|:----:|:-----------------:|
| 12345 | MRN12345 | 1979 | 47 | FEMALE | White | Hispanic or Latino |

*Query returned 1 row*

</div>

This result demonstrates several key OMOP CDM principles:

1. **person_id (12345)**: The unique identifier assigned to Maria in the CDM, linking all her clinical data
2. **person_source_value (MRN12345)**: The original identifier from the source EHR system
3. **Standardized concepts**: Gender, race, and ethnicity are stored as concept_ids that reference the vocabulary tables, enabling consistent querying across diverse source systems

```sql
<a id="table-14-omop-person-mapping"></a>

**Table 1.4: OMOP Person Table Mapping**

-- Query: Patient Demographics with Care Site
SELECT
    p.person_id,
    p.person_source_value AS mrn,
    EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth AS age,
    gc.concept_name AS gender,
    rc.concept_name AS race,
    ec.concept_name AS ethnicity,
    l.city,
    l.state
FROM cdm.person p
LEFT JOIN vocabulary.concept gc ON p.gender_concept_id = gc.concept_id
LEFT JOIN vocabulary.concept rc ON p.race_concept_id = rc.concept_id
LEFT JOIN vocabulary.concept ec ON p.ethnicity_concept_id = ec.concept_id
LEFT JOIN cdm.location l ON p.location_id = l.location_id
WHERE p.person_id = 12345;
```

<div align="center">

| person_id | mrn | age | gender | race | ethnicity | city | state |
|:---------:|:--------:|:---:|:------:|:----:|:-----------------:|:-----------:|:-----:|
| 12345 | MRN12345 | 47 | FEMALE | White | Hispanic or Latino | Springfield | IL |

</div>

**ATLAS Cohort Definition:**

For users of ATLAS (the OHDSI cohort definition tool), this phenotype would be configured as follows:

```json
{
  "ConceptSets": [],
  "PrimaryCriteria": {
    "CriteriaList": [
      {
        "VisitOccurrence": {
          "CodesetId": null,
          "VisitTypeExclude": false,
          "VisitSourceConcept": null,
          "VisitConceptId": 9202
        }
      }
    ],
    "ObservationWindow": {
      "PriorDays": 0,
      "PostDays": 0
    },
    "PrimaryCriteriaLimit": {
      "Type": "First"
    }
  },
  "QualifiedLimit": {
    "Type": "First"
  },
  "ExpressionLimit": {
    "Type": "First"
  },
  "InclusionRules": [],
  "ExclusionRules": [
    {
      "name": "Has prior visit",
      "expression": {
        "Type": "ANY",
        "CriteriaList": [
          {
            "Criteria": {
              "VisitOccurrence": {}
            },
            "StartWindow": {
              "Start": {
                "Coeff": -1
              },
              "End": {
                "Days": -1,
                "Coeff": -1
              }
            }
          }
        ]
      }
    }
  ],
  "CensoringCriteria": []
}
```

---

## 1.5 Technology Solution Layer

### FHIR Operations for Patient Registration

The following FHIR operations support the registration workflow:

**Create New Patient:**
```http
POST /fhir/Patient HTTP/1.1
Host: fhir.communityhealthclinic.org
Content-Type: application/fhir+json
Authorization: Bearer {access_token}

{
  "resourceType": "Patient",
  "name": [{"family": "Rodriguez", "given": ["Maria"]}],
  "birthDate": "1979-03-15",
  "gender": "female"
  // ... additional fields
}
```

**Search for Existing Patient:**
```http
GET /fhir/Patient?family=Rodriguez&birthdate=1979-03-15 HTTP/1.1
Host: fhir.communityhealthclinic.org
Authorization: Bearer {access_token}
```

**Update Patient Demographics:**
```http
PUT /fhir/Patient/maria-rodriguez-12345 HTTP/1.1
Host: fhir.communityhealthclinic.org
Content-Type: application/fhir+json
Authorization: Bearer {access_token}

{
  "resourceType": "Patient",
  "id": "maria-rodriguez-12345",
  // ... updated resource
}
```

### Python Implementation

The following provides a production-ready Python implementation for patient registration:

```python
"""
Patient Registration Service
Community Health Clinic EHR Integration

This module handles patient registration operations including:
- Patient search and matching
- New patient creation
- Insurance eligibility verification
- Encounter initialization
"""

from datetime import date, datetime
from typing import Optional, List
from pydantic import BaseModel, Field
import httpx
from fhir.resources.patient import Patient
from fhir.resources.coverage import Coverage
from fhir.resources.encounter import Encounter

# Configuration
FHIR_SERVER_URL = "https://fhir.communityhealthclinic.org/fhir"


class PatientDemographics(BaseModel):
    """Demographics input for patient registration."""
    first_name: str = Field(..., min_length=1, max_length=100)
    last_name: str = Field(..., min_length=1, max_length=100)
    date_of_birth: date
    gender: str = Field(..., pattern="^(male|female|other|unknown)$")
    address_line: Optional[str] = None
    city: Optional[str] = None
    state: Optional[str] = Field(None, pattern="^[A-Z]{2}$")
    postal_code: Optional[str] = None
    phone_home: Optional[str] = None
    phone_work: Optional[str] = None
    medicaid_id: Optional[str] = None


class PatientSearchResult(BaseModel):
    """Result from patient search."""
    patient_id: str
    name: str
    date_of_birth: date
    mrn: str
    match_score: float = Field(..., ge=0, le=1)


class RegistrationService:
    """
    Handles patient registration workflow.

    This service coordinates:
    1. Patient search/matching in MPI
    2. New patient creation
    3. Insurance eligibility verification
    4. Encounter initialization
    """

    def __init__(self, fhir_client: httpx.AsyncClient):
        self.client = fhir_client
        self.base_url = FHIR_SERVER_URL

    async def search_patient(
        self,
        last_name: str,
        date_of_birth: date,
        first_name: Optional[str] = None
    ) -> List[PatientSearchResult]:
        """
        Search for existing patient in MPI.

        Args:
            last_name: Patient's family name
            date_of_birth: Patient's birth date
            first_name: Optional given name for narrower search

        Returns:
            List of potential matches with confidence scores
        """
        params = {
            "family": last_name,
            "birthdate": date_of_birth.isoformat()
        }
        if first_name:
            params["given"] = first_name

        response = await self.client.get(
            f"{self.base_url}/Patient",
            params=params
        )
        response.raise_for_status()

        bundle = response.json()
        results = []

        for entry in bundle.get("entry", []):
            patient = entry["resource"]
            # Calculate match score based on field matching
            score = self._calculate_match_score(
                patient, last_name, date_of_birth, first_name
            )

            results.append(PatientSearchResult(
                patient_id=patient["id"],
                name=self._format_name(patient["name"][0]),
                date_of_birth=date.fromisoformat(patient["birthDate"]),
                mrn=self._extract_mrn(patient),
                match_score=score
            ))

        return sorted(results, key=lambda x: x.match_score, reverse=True)

    async def register_patient(
        self,
        demographics: PatientDemographics
    ) -> Patient:
        """
        Register a new patient in the EHR.

        Args:
            demographics: Patient demographic information

        Returns:
            Created FHIR Patient resource
        """
        patient = Patient(
            name=[{
                "use": "official",
                "family": demographics.last_name,
                "given": [demographics.first_name]
            }],
            birthDate=demographics.date_of_birth.isoformat(),
            gender=demographics.gender,
            telecom=[],
            address=[]
        )

        # Add phone numbers if provided
        if demographics.phone_home:
            patient.telecom.append({
                "system": "phone",
                "value": demographics.phone_home,
                "use": "home"
            })
        if demographics.phone_work:
            patient.telecom.append({
                "system": "phone",
                "value": demographics.phone_work,
                "use": "work"
            })

        # Add address if provided
        if demographics.address_line:
            patient.address.append({
                "use": "home",
                "line": [demographics.address_line],
                "city": demographics.city,
                "state": demographics.state,
                "postalCode": demographics.postal_code
            })

        # Create patient in FHIR server
        response = await self.client.post(
            f"{self.base_url}/Patient",
            json=patient.dict(exclude_none=True)
        )
        response.raise_for_status()

        created_patient = Patient.parse_obj(response.json())

        # If Medicaid ID provided, create coverage resource
        if demographics.medicaid_id:
            await self._create_medicaid_coverage(
                created_patient.id,
                demographics.medicaid_id
            )

        return created_patient

    async def verify_eligibility(
        self,
        medicaid_id: str,
        service_date: date
    ) -> dict:
        """
        Verify Medicaid eligibility via X12 270/271.

        Args:
            medicaid_id: Patient's Medicaid identifier
            service_date: Date of service for eligibility check

        Returns:
            Eligibility response with coverage details
        """
        # In production, this would call an eligibility clearinghouse
        # For demonstration, a simulated response is returned
        return {
            "status": "active",
            "coverage_start": "2025-01-01",
            "coverage_end": "2026-12-31",
            "plan_name": "Meridian Health Plan of Illinois",
            "copay": 0,
            "prior_auth_required": False
        }

    async def create_encounter(
        self,
        patient_id: str,
        provider_id: str,
        reason: str
    ) -> Encounter:
        """
        Initialize an encounter for the patient visit.

        Args:
            patient_id: FHIR Patient resource ID
            provider_id: FHIR Practitioner resource ID
            reason: Chief complaint or reason for visit

        Returns:
            Created FHIR Encounter resource
        """
        encounter = Encounter(
            status="arrived",
            class_fhir={
                "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                "code": "AMB",
                "display": "ambulatory"
            },
            subject={"reference": f"Patient/{patient_id}"},
            participant=[{
                "type": [{
                    "coding": [{
                        "system": "http://terminology.hl7.org/CodeSystem/v3-ParticipationType",
                        "code": "ATND"
                    }]
                }],
                "individual": {"reference": f"Practitioner/{provider_id}"}
            }],
            period={"start": datetime.now().isoformat()},
            reasonCode=[{"text": reason}]
        )

        response = await self.client.post(
            f"{self.base_url}/Encounter",
            json=encounter.dict(exclude_none=True)
        )
        response.raise_for_status()

        return Encounter.parse_obj(response.json())

    def _calculate_match_score(
        self,
        patient: dict,
        last_name: str,
        dob: date,
        first_name: Optional[str]
    ) -> float:
        """Calculate probabilistic match score."""
        score = 0.0

        # Name matching (40% weight)
        patient_name = patient["name"][0]
        if patient_name.get("family", "").lower() == last_name.lower():
            score += 0.25
        if first_name and first_name.lower() in [
            n.lower() for n in patient_name.get("given", [])
        ]:
            score += 0.15

        # DOB matching (40% weight)
        if patient["birthDate"] == dob.isoformat():
            score += 0.40

        # Gender consistency (10% weight)
        if patient.get("gender"):
            score += 0.10

        # Has identifiers (10% weight)
        if patient.get("identifier"):
            score += 0.10

        return min(score, 1.0)

    def _format_name(self, name: dict) -> str:
        """Format FHIR HumanName to display string."""
        given = " ".join(name.get("given", []))
        family = name.get("family", "")
        return f"{given} {family}".strip()

    def _extract_mrn(self, patient: dict) -> str:
        """Extract MRN from patient identifiers."""
        for identifier in patient.get("identifier", []):
            if identifier.get("type", {}).get("coding", [{}])[0].get("code") == "MR":
                return identifier.get("value", "")
        return ""

    async def _create_medicaid_coverage(
        self,
        patient_id: str,
        medicaid_id: str
    ) -> Coverage:
        """Create Coverage resource for Medicaid enrollment."""
        coverage = Coverage(
            status="active",
            type={
                "coding": [{
                    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                    "code": "SUBSIDMC"
                }]
            },
            subscriber={"reference": f"Patient/{patient_id}"},
            beneficiary={"reference": f"Patient/{patient_id}"},
            payor=[{"display": "Illinois Medicaid"}],
            identifier=[{
                "system": "http://illinois.gov/medicaid",
                "value": medicaid_id
            }]
        )

        response = await self.client.post(
            f"{self.base_url}/Coverage",
            json=coverage.dict(exclude_none=True)
        )
        response.raise_for_status()

        return Coverage.parse_obj(response.json())


# Example usage
async def main():
    """Demonstrate patient registration workflow."""
    async with httpx.AsyncClient() as client:
        service = RegistrationService(client)

        # Search for existing patient
        results = await service.search_patient(
            last_name="Rodriguez",
            date_of_birth=date(1979, 3, 15),
            first_name="Maria"
        )

        if results and results[0].match_score > 0.85:
            print(f"Found existing patient: {results[0].name}")
            patient_id = results[0].patient_id
        else:
            # Register new patient
            demographics = PatientDemographics(
                first_name="Maria",
                last_name="Rodriguez",
                date_of_birth=date(1979, 3, 15),
                gender="female",
                address_line="123 Main Street",
                city="Springfield",
                state="IL",
                postal_code="62701",
                phone_home="217-555-1234",
                medicaid_id="IL987654321"
            )
            patient = await service.register_patient(demographics)
            patient_id = patient.id
            print(f"Created new patient: {patient_id}")

        # Verify insurance eligibility
        eligibility = await service.verify_eligibility(
            medicaid_id="IL987654321",
            service_date=date.today()
        )
        print(f"Eligibility status: {eligibility['status']}")

        # Create encounter
        encounter = await service.create_encounter(
            patient_id=patient_id,
            provider_id="dr-sarah-chen",
            reason="Fatigue, elevated blood sugars, heart palpitations"
        )
        print(f"Created encounter: {encounter.id}")


if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
```

---

## 1.6 Chapter 1 Mindmap: Patient Registration Workflow

<a id="figure-11-registration-workflow"></a>

![Patient Registration Workflow](../assets/infographics/03_patient_registration_workflow.svg)

*Figure 1.1: Patient Registration Workflow — Three-track process from patient contact through identity verification to insurance check, with data systems updated and terminology standards applied*

---

## 1.7 Chapter Summary: Key Takeaways


### Clinical Practice Insights

1. **Registration is clinical care:** The data captured at registration directly impacts patient safety. Incorrect demographics can lead to medication errors, missed communications, and fragmented care.

2. **Triage begins at first contact:** Karen and Lisa's symptom assessment during scheduling changed Maria's trajectory. Without recognizing the significance of new palpitations in a diabetic patient, Maria might have waited days for evaluation.

3. **Insurance is a social determinant:** Maria's Medicaid status identifies her as a member of a vulnerable population requiring additional care coordination support.

### Technical Implementation Insights

1. **Master Patient Index (MPI):** Probabilistic matching algorithms prevent duplicate records while allowing for data variation.

2. **Real-time eligibility:** X12 270/271 transactions verify insurance coverage in seconds, replacing manual phone verification.

3. **Multi-standard data capture:** A single registration generates HL7 v2 messages, FHIR resources, and updates to analytics systems.

### Standards Mapping

| Domain | Standard | Use in Registration |
|--------|----------|---------------------|
| Demographics | CDC Race/Ethnicity | Federal reporting |
| Messaging | HL7 v2.5 ADT^A04 | System integration |
| Interoperability | FHIR R4 Patient | API access, HIE |
| Insurance | X12 270/271 | Eligibility verification |
| Research | OMOP CDM person | Population analytics |

### Phenotyping Concepts

- **Cohort definition:** Clear inclusion/exclusion criteria
- **Temporal constraints:** "First visit" requires no prior visits
- **Data quality:** Phenotypes depend on complete, accurate registration data

---

### Looking Ahead

In Chapter 2, we follow Maria into the examination room where Dr. Chen will discover something unexpected during a routine diabetes follow-up. The clinical encounter will generate a wealth of structured data—vital signs, clinical notes, problem lists, and ultimately, a new diagnosis that changes Maria's care trajectory.

The registration data we captured in this chapter becomes the foundation for everything that follows. Maria's patient_id links to every observation, condition, medication, and procedure. Her insurance coverage determines what specialists she can see and what medications are affordable. Her demographic information enables quality measurement and health equity analysis.

Registration is where the patient's data story begins. Now let's see how that story unfolds.

---

## 1.8 Interesting Facts

<div style="background-color: #e7f3ff; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **The Cost of Duplicate Records:** The American Health Information Management Association (AHIMA) estimates that duplicate patient records cost U.S. healthcare systems **$1,950 per duplicate** on average, and up to **8-12% of all patient records** in a typical hospital are duplicates. This translates to billions of dollars in unnecessary costs annually.

2. **The 270/271 Transaction:** Before electronic eligibility verification, front desk staff spent an average of **20 minutes per patient** calling insurance companies to verify coverage. Today's X12 270/271 transactions complete in **under 5 seconds**, saving approximately 200,000 staff hours annually for a typical health system.

3. **The First EMR:** The first electronic medical record system was developed at the **Regenstrief Institute** in Indianapolis in 1972. It could store patient problems, medications, and lab results—remarkably similar to modern EHR problem lists.

4. **Why "Rodriguez"?** Maria's surname represents the **10th most common surname** in the United States, reflecting the demographic reality that Hispanic patients comprise 19% of the U.S. population and are disproportionately served by community health centers like CHC.

5. **The MRN Mystery:** Medical Record Numbers were first standardized in the 1920s when **Mayo Clinic** pioneered the "unit record" system—keeping all of a patient's information in a single folder. This revolutionary concept forms the basis of modern patient identification.

6. **Race and Ethnicity Codes:** The OMB 15 race and ethnicity categories used in U.S. healthcare were established by the **Office of Management and Budget in 1997** (Directive 15) and are distinct from clinical race concepts used in some clinical decision support algorithms.

</div>

---

## 1.9 References & Sources

### Clinical Guidelines & Standards

1. **Joint Commission.** (2024). *National Patient Safety Goals: Identification Protocols*. The Joint Commission. https://www.jointcommission.org/standards/national-patient-safety-goals/

2. **AHIMA.** (2023). *Patient Matching Best Practices and Framework*. American Health Information Management Association. https://www.ahima.org/patient-matching

3. **CMS.** (2024). *HIPAA Administrative Simplification: X12 Transaction Standards*. Centers for Medicare & Medicaid Services. https://www.cms.gov/Regulations-and-Guidance/Administrative-Simplification/Transactions

### Technical Standards

4. **HL7 International.** (2024). *FHIR R4 Patient Resource Specification*. http://hl7.org/fhir/R4/patient.html

5. **HL7 International.** (2023). *HL7 Version 2.5.1 Implementation Guide: ADT Messages*. https://www.hl7.org/implement/standards/product_brief.cfm?product_id=144

6. **OHDSI.** (2024). *OMOP Common Data Model v5.4 Specification: PERSON Table*. https://ohdsi.github.io/CommonDataModel/cdm54.html#PERSON

7. **X12.** (2024). *270/271 Health Care Eligibility Benefit Inquiry and Response*. https://x12.org/products/transaction-sets

### Research & Evidence

8. **Just, B.H., et al.** (2016). Why Patient Matching Is a Challenge: Research on Master Patient Index (MPI) Data Discrepancies in Key Identifying Fields. *Perspectives in Health Information Management*, 13(Spring), 1e.

9. **Hillestad, R., et al.** (2005). Can Electronic Medical Record Systems Transform Health Care? Potential Health Benefits, Savings, And Costs. *Health Affairs*, 24(5), 1103-1117. https://doi.org/10.1377/hlthaff.24.5.1103

10. **Morris, G., et al.** (2014). *Patient Identification and Matching Final Report*. Office of the National Coordinator for Health Information Technology (ONC).

### Regulatory References

11. **45 CFR § 164.514** - HIPAA Privacy Rule: De-identification of Protected Health Information

12. **42 CFR Part 2** - Confidentiality of Substance Use Disorder Patient Records

13. **OMB Directive 15** (1997) - Standards for Maintaining, Collecting, and Presenting Federal Data on Race and Ethnicity

---

<div style="page-break-after: always;"></div>

---

# Part II: Clinical Encounter

# Chapter 2: The Clinical Encounter & Documentation

## 2.1 Clinical Narrative

### Monday, January 13, 2026 — 11:45 AM

Lisa Brown, RN, appeared in the waiting room. "Maria Rodriguez?"

Maria gathered her purse and followed Lisa down the hallway past examination rooms, a small procedure area, and the nursing station where two other nurses charted on computers. The walls displayed patient education posters in both English and Spanish—diabetes management, heart health, childhood immunizations.

"We're going to room 3 today," Lisa said, gesturing toward an open door. "Let's get your vitals and update your chart before Dr. Chen comes in."

Maria settled onto the examination table while Lisa washed her hands and prepared her equipment. The vital signs machine hummed as it powered on.

---

### The Nursing Assessment

Lisa began with the standardized intake protocol:

**Height and Weight:**
"Let me get your weight first. Step on the scale facing away from the numbers."

The digital readout displayed 187 lbs. Lisa noted Maria had lost 2 pounds since her last visit four months ago—not clinically significant, but worth documenting.

"And your height is 5'4", same as last time."

Lisa's mind automatically calculated: BMI = 32.1 kg/m² (Obesity Class I).

**Vital Signs:**
Lisa wrapped the automated blood pressure cuff around Maria's left arm. "Just relax your arm and we'll get your blood pressure."

The machine cycled through its measurement. Lisa watched the numbers settle:
- **Blood Pressure:** 148/92 mmHg

That was elevated. Maria's baseline typically ran around 130/82 on her Lisinopril. Lisa made a mental note.

"Let me take your pulse manually," Lisa said, placing her fingers on Maria's radial artery.

She felt it immediately—an irregularly irregular rhythm. No predictable pattern. Some beats strong, some weak. She counted for 60 seconds: approximately 98 beats per minute, but the irregularity made precise counting difficult.

**Heart Rate:** 98 bpm, irregular

Lisa kept her expression neutral, but her clinical antenna was up. Irregular rhythm in a patient with hypertension and diabetes could indicate atrial fibrillation. Combined with the chief complaint of "heart fluttering," this was starting to form a concerning picture.

She continued with the remaining vitals:
- **Respiratory Rate:** 18 breaths/min (counted during the blood pressure measurement)
- **Temperature:** 98.4°F (oral)
- **Oxygen Saturation:** 97% on room air

"Your vitals are a little different today," Lisa said carefully. "Your blood pressure is higher than usual, and I noticed your heart rhythm is irregular. Dr. Chen will want to talk with you about that."

**Point-of-Care Testing:**

"Since you mentioned your blood sugars have been running high, let me check your glucose now."

Lisa performed a fingerstick and loaded the capillary blood into the clinic's glucose meter.

**Random Glucose:** 218 mg/dL

Maria winced. "That's really high for me. I didn't even eat breakfast today."

"We'll let Dr. Chen know. She'll probably want to talk about your medication."

---

### Documentation: The Nursing Assessment

Lisa documented her findings in the EHR, using a combination of structured data entry (for vitals) and free text (for her clinical observations):

```
NURSING ASSESSMENT
Date: 01/13/2026 11:52 AM
Patient: Rodriguez, Maria (MRN: 12345)
Provider: Lisa Brown, RN

VITAL SIGNS:
Blood Pressure: 148/92 mmHg (Left arm, sitting)
Heart Rate: 98 bpm - IRREGULAR
Respiratory Rate: 18 breaths/min
Temperature: 98.4°F (Oral)
SpO2: 97% (Room air)
Weight: 187 lbs (84.8 kg)
Height: 5'4" (162.5 cm)
BMI: 32.1 kg/m²
Pain Scale: 2/10 (generalized fatigue)

POINT-OF-CARE TESTING:
Random Glucose: 218 mg/dL (H)

CHIEF COMPLAINT:
Patient reports 2-week history of fatigue and 1-week history of
heart "fluttering" episodes. Notes blood sugars running 180-220 mg/dL
fasting (usually 130-140). Occasional mild lightheadedness with
palpitations. Denies chest pain, syncope, or dyspnea.

MEDICATION RECONCILIATION:
Current Medications (patient confirmed):
1. Metformin 500mg - 1 tablet by mouth twice daily (patient reports
   occasionally missing evening dose)
2. Lisinopril 20mg - 1 tablet by mouth once daily

ALLERGIES: NKDA (No Known Drug Allergies) - Confirmed

NURSING OBSERVATIONS:
Irregular pulse noted on manual palpation - irregularly irregular
pattern. Patient appears tired but in no acute distress. Alert and
oriented x4. No peripheral edema noted. Skin warm and dry.

ABNORMAL FINDINGS FLAGGED FOR PROVIDER:
- Elevated BP (148/92 vs baseline ~130/82)
- Irregular heart rhythm
- Elevated random glucose (218 mg/dL)
- Reported palpitations with mild lightheadedness

Assessment: Same-day add-on for diabetes follow-up with new symptoms
of palpitations and fatigue. Vital sign abnormalities noted. Provider
notified of irregular rhythm - recommend EKG.

Electronically signed: Lisa Brown, RN
01/13/2026 11:55 AM
```

---

### The Provider Encounter

Dr. Sarah Chen knocked on the exam room door at 12:03 PM. She had just reviewed Lisa's documentation and Maria's recent chart history on the hallway workstation.

"Maria, it's good to see you. I understand you haven't been feeling well."

Dr. Chen pulled up the rolling stool and sat down, placing her laptop on the counter. She preferred face-to-face conversation during the history, only turning to document periodically.

"Tell me what's been going on."

Maria described her symptoms: the creeping fatigue that had worsened over two weeks, the palpitations that started about a week ago, the blood sugars that wouldn't come down despite her usual routine.

"The heart thing is what worries me most," Maria admitted. "It feels like my heart just goes crazy sometimes—jumping and racing. Usually lasts a few minutes, sometimes longer. It happened twice yesterday."

Dr. Chen nodded, mentally constructing her differential diagnosis:

**Palpitations with fatigue in a patient with diabetes and hypertension:**
1. Atrial fibrillation (high on list given risk factors)
2. Other arrhythmia (SVT, PVCs, PACs)
3. Hyperthyroidism (can cause both palpitations and fatigue)
4. Anemia (fatigue, potential palpitations from compensatory tachycardia)
5. Anxiety/panic (patient seems calm, but worth considering)
6. Medication-related (Metformin doesn't typically cause palpitations)
7. Electrolyte imbalance (hypokalemia, hypomagnesemia)

"Have you had any chest pain? Shortness of breath? Any fainting or near-fainting?"

"No chest pain. I get a little lightheaded when my heart acts up, but I've never passed out."

"Any recent illness? Fever? Cough?"

"No, I've been healthy otherwise."

"How about caffeine? Alcohol? Any new supplements or medications?"

"I have my usual coffee in the morning, nothing more. Maybe a glass of wine on the weekend. No new supplements."

"And your stress level? How are things at work and home?"

"Teaching is always stressful, but not more than usual. The kids are doing okay."

---

### The Physical Examination

Dr. Chen began her focused examination, documenting findings as she went:

**General:** Alert, appears tired but not acutely ill. No respiratory distress.

**HEENT:** Normocephalic, atraumatic. Pupils equal, round, reactive to light. Oropharynx clear without erythema.

**Neck:** Supple, no thyromegaly, no JVD (jugular venous distension). Carotid pulses intact without bruits.

**Cardiovascular:**
Dr. Chen placed her stethoscope on Maria's chest. She immediately heard it—an irregularly irregular rhythm with a rate she estimated around 95-100 bpm. No murmurs. Heart sounds otherwise normal.

"Maria, I can hear that irregular rhythm Lisa mentioned. I'm going to order an EKG right now so we can see exactly what's happening."

**Lungs:** Clear to auscultation bilaterally. No wheezes, rales, or rhonchi.

**Abdomen:** Soft, non-tender, non-distended. No hepatomegaly. Bowel sounds present.

**Extremities:** No peripheral edema. Dorsalis pedis and posterior tibial pulses 2+ bilaterally. Skin intact on feet (important in diabetic patients).

**Neurological:** Alert and oriented to person, place, time, and situation. No focal deficits.

---

### The EKG

Dr. Chen stepped out briefly to arrange the EKG. Within five minutes, a medical assistant brought the 12-lead EKG machine into the room.

"This will just take a minute, Ms. Rodriguez. Try to hold still and relax."

The tracing printed:

```
12-LEAD ELECTROCARDIOGRAM
Date: 01/13/2026 12:18 PM
Patient: Rodriguez, Maria
MRN: 12345

RATE: 98 bpm (variable, 85-110 bpm range)
RHYTHM: Irregularly irregular - no discernible P waves
PR INTERVAL: Not measurable (no P waves)
QRS DURATION: 88 ms
QT/QTc: 380/440 ms

INTERPRETATION:
Atrial fibrillation with rapid ventricular response
Normal QRS axis
No significant ST-T changes
No evidence of acute ischemia
QTc within normal limits

Interpreted by: Sarah Chen, MD
```

Dr. Chen studied the tracing. The hallmark finding was clear: irregularly irregular R-R intervals with absent P waves, replaced by fibrillatory waves. This was atrial fibrillation.

She returned to the exam room with the EKG printout.

"Maria, I have an answer for your palpitations. Your heart is in a rhythm called atrial fibrillation, or AFib. The upper chambers of your heart are beating irregularly instead of in their normal rhythm."

Maria's face showed concern. "Is that dangerous?"

"It's a common condition, and we can treat it. But there are a few things we need to do. First, AFib can increase your risk of stroke, so we'll need to start you on a blood thinner. Second, we need to control your heart rate with medication. And third, I want you to see a cardiologist to make sure we're managing this correctly."

---

### Clinical Decision-Making: CHA₂DS₂-VASc Score

<a id="table-61-cha2ds2-vasc"></a>

Dr. Chen pulled up the stroke risk calculator in her EHR. For patients with atrial fibrillation, the CHA₂DS₂-VASc score determines whether anticoagulation is recommended:

**Table 6.1: CHA₂DS₂-VASc Score Components**

| Factor | Points | Maria |
|--------|--------|-------|
| **C**ongestive heart failure | 1 | No → 0 |
| **H**ypertension | 1 | Yes → 1 |
| **A**ge ≥75 years | 2 | No (46) → 0 |
| **D**iabetes mellitus | 1 | Yes → 1 |
| **S**troke/TIA/thromboembolism | 2 | No → 0 |
| **V**ascular disease | 1 | No → 0 |
| **A**ge 65-74 years | 1 | No → 0 |
| **S**ex category (female) | 1 | Yes → 1 |
| **Total** | | **3** |

**CHA₂DS₂-VASc Score: 3**

**Annual Stroke Risk: 3.2%** without anticoagulation

**Guidelines Recommendation:** Oral anticoagulation strongly recommended for women with score ≥2 (men ≥1).

<a id="table-62-has-bled"></a>

Dr. Chen also calculated the bleeding risk using the HAS-BLED score:

**Table 6.2: HAS-BLED Score Components**

| Factor | Points | Maria |
|--------|--------|-------|
| **H**ypertension | 1 | Yes → 1 |
| **A**bnormal renal/liver function | 1-2 | No → 0 |
| **S**troke | 1 | No → 0 |
| **B**leeding history | 1 | No → 0 |
| **L**abile INR | 1 | N/A (DOAC) → 0 |
| **E**lderly (>65) | 1 | No → 0 |
| **D**rugs/alcohol | 1-2 | No → 0 |
| **Total** | | **1** |

**HAS-BLED Score: 1** (Low bleeding risk)

<a id="table-63-risk-results"></a>

**Table 6.3: Maria's Risk Stratification Results**

The math was clear: Maria's stroke risk (3.2%/year) significantly outweighed her bleeding risk. Anticoagulation was indicated.

---

### The SOAP Note

Dr. Chen documented the encounter using the SOAP format:

```
PROGRESS NOTE
Date: 01/13/2026
Patient: Rodriguez, Maria (MRN: 12345)
Provider: Sarah Chen, MD
Visit Type: Follow-up, Same-Day Add-On

SUBJECTIVE:
46 yo F with PMH of T2DM x 3 years, HTN x 5 years presents for
diabetes follow-up with new symptoms of fatigue and palpitations.

Chief Complaint: Fatigue x 2 weeks, palpitations x 1 week

HPI: Patient reports progressive fatigue over the past 2 weeks,
describing it as "exhaustion" affecting her ability to complete
normal daily activities including work as a teacher. Approximately
1 week ago, she began experiencing episodes of heart "fluttering"
described as a sensation of the heart "jumping around" or racing.
Episodes last minutes to hours, occurring 2-3 times daily. Associated
with mild lightheadedness. Denies chest pain, dyspnea, syncope,
presyncope, or lower extremity edema.

Additionally notes blood glucose readings running 180-220 mg/dL
fasting (baseline 130-140 mg/dL). Reports occasional missed evening
Metformin doses.

ROS:
Constitutional: (+) Fatigue, (-) fever, (-) weight loss
Cardiovascular: (+) Palpitations, (+) mild lightheadedness with
  palpitations, (-) chest pain, (-) dyspnea, (-) orthopnea, (-) PND,
  (-) lower extremity edema
Respiratory: (-) Cough, (-) dyspnea, (-) wheezing
GI: (-) Nausea, (-) vomiting, (-) abdominal pain
Neurological: (-) Syncope, (-) focal weakness, (-) numbness
Psychiatric: (-) Anxiety, (-) depression

OBJECTIVE:
Vital Signs (per nursing):
  BP: 148/92 mmHg
  HR: 98 bpm, irregular
  RR: 18
  Temp: 98.4°F
  SpO2: 97% RA
  Wt: 187 lbs (84.8 kg)
  Ht: 5'4" (162.5 cm)
  BMI: 32.1 kg/m²

Point-of-Care: Random glucose 218 mg/dL (H)

Physical Examination:
General: Alert, appears fatigued, no acute distress
HEENT: NC/AT, PERRL, oropharynx clear
Neck: Supple, no thyromegaly, no JVD, no carotid bruits
Cardiovascular: Irregularly irregular rhythm, rate ~95-100 bpm,
  no murmurs, rubs, or gallops
Lungs: Clear to auscultation bilaterally
Abdomen: Soft, NT/ND, no hepatomegaly, +BS
Extremities: No edema, pulses 2+ DP/PT bilaterally, skin intact
Neuro: A&O x4, no focal deficits

EKG (12-lead, performed today):
Atrial fibrillation with RVR, rate 98 bpm (range 85-110)
Normal axis, QRS 88ms, QTc 440ms
No ST-T changes concerning for ischemia

Recent Labs (from PCP visit 09/15/2025):
  HbA1c: 7.8%
  BMP: Within normal limits
  eGFR: >60 mL/min/1.73m²

ASSESSMENT:
1. Atrial fibrillation with rapid ventricular response - NEW DIAGNOSIS
   - Likely paroxysmal given recent onset of symptoms (~1 week)
   - No evidence of hemodynamic instability
   - Risk factors: HTN, DM, obesity

2. Type 2 Diabetes Mellitus - suboptimally controlled
   - Last HbA1c 7.8% (09/2025), today's random glucose 218 mg/dL
   - Reports occasional medication non-adherence
   - Goal HbA1c <7%

3. Essential Hypertension - above goal
   - Today's BP 148/92 (goal <130/80 per AHA/ACC guidelines)
   - May be contributed to by new-onset AFib

4. Obesity Class I
   - BMI 32.1 kg/m²
   - Contributing risk factor for AFib and metabolic disease

CLINICAL DECISION SUPPORT:
CHA₂DS₂-VASc Score: 3 (HTN +1, DM +1, Female +1)
  → Annual stroke risk 3.2%
  → Anticoagulation strongly recommended (Class I, Level A)

HAS-BLED Score: 1 (HTN +1)
  → Low bleeding risk
  → Favorable risk-benefit for anticoagulation

PLAN:
1. Atrial Fibrillation:
   a. Anticoagulation for stroke prevention:
      - Start Apixaban 5mg PO BID
      - No dose reduction needed (age <80, weight >60kg, CrCl >25)
      - Counseled patient on bleeding precautions
   b. Rate control:
      - Start Metoprolol Succinate ER 25mg PO daily
      - Goal resting HR 60-80 bpm
   c. Referral to Cardiology:
      - Urgent referral to Dr. Michael Torres
      - For evaluation of rhythm vs rate control strategy
      - Consider echocardiogram to assess for structural disease
   d. Patient education:
      - Provided written materials on AFib
      - Warning signs of stroke (FAST: Face, Arms, Speech, Time)
      - When to seek emergency care
   e. Labs ordered:
      - TSH (rule out hyperthyroidism)
      - CBC (baseline before anticoagulation)
      - CMP (baseline renal/hepatic function)
      - Lipid panel (cardiovascular risk assessment)

2. Diabetes Mellitus:
   a. Increase Metformin to 1000mg PO BID (from 500mg BID)
   b. Counseled on medication adherence - evening doses
   c. Continue home glucose monitoring
   d. Recheck HbA1c in 3 months
   e. Dietary counseling referral

3. Hypertension:
   a. Continue Lisinopril 20mg daily
   b. Addition of Metoprolol will help BP as well
   c. Goal BP <130/80
   d. Lifestyle modifications discussed

4. Obesity:
   a. Discussed weight loss as modifiable risk factor
   b. Goal: 5-10% weight loss over 6-12 months
   c. Consider dietitian referral

FOLLOW-UP:
- Cardiology appointment within 1-2 weeks
- PCP follow-up in 2 weeks for BP check and medication tolerance
- Return to clinic or ED if: chest pain, severe palpitations,
  dizziness/syncope, signs of bleeding, stroke symptoms

Time Spent: 45 minutes (>50% counseling and coordination)
E&M Level: 99215 (established patient, high complexity)

Electronically signed by Sarah Chen, MD
01/13/2026 12:58 PM
```

---

### Provider Perspective

> "This visit started as a routine diabetes follow-up but uncovered a new diagnosis of atrial fibrillation. This is why we take vitals seriously—Lisa's recognition of an irregular pulse triggered the EKG that confirmed AFib. If we had missed this, Maria could have had a devastating stroke in the coming weeks or months.
>
> Documentation matters here in multiple ways. My clinical note needs to capture my medical decision-making clearly enough that any provider reviewing it will understand why I started anticoagulation. The CHA₂DS₂-VASc score isn't just for billing—it's my clinical justification for prescribing a medication with real bleeding risks. If Maria ever has a bleeding complication, my documentation today will be reviewed to determine if the anticoagulation was appropriate.
>
> I also documented my patient counseling. Maria needs to understand her stroke risk, her new medications, and when to seek emergency care. That education is as important as the prescription itself."
>
> — Sarah Chen, MD

---

## 2.2 EHR Data Population

### Vital Signs as FHIR Observations

Each vital sign Lisa recorded became a discrete FHIR Observation resource:

**Blood Pressure Observation:**

```json
{
  "resourceType": "Observation",
  "id": "bp-maria-20260113",
  "status": "final",
  "category": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/observation-category",
      "code": "vital-signs",
      "display": "Vital Signs"
    }]
  }],
  "code": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "85354-9",
      "display": "Blood pressure panel with all children optional"
    }]
  },
  "subject": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "encounter": {
    "reference": "Encounter/encounter-20260113-maria"
  },
  "effectiveDateTime": "2026-01-13T11:47:00-06:00",
  "performer": [{
    "reference": "Practitioner/lisa-brown-rn"
  }],
  "bodySite": {
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "368208006",
      "display": "Left upper arm"
    }]
  },
  "component": [
    {
      "code": {
        "coding": [{
          "system": "http://loinc.org",
          "code": "8480-6",
          "display": "Systolic blood pressure"
        }]
      },
      "valueQuantity": {
        "value": 148,
        "unit": "mmHg",
        "system": "http://unitsofmeasure.org",
        "code": "mm[Hg]"
      },
      "interpretation": [{
        "coding": [{
          "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "code": "H",
          "display": "High"
        }]
      }]
    },
    {
      "code": {
        "coding": [{
          "system": "http://loinc.org",
          "code": "8462-4",
          "display": "Diastolic blood pressure"
        }]
      },
      "valueQuantity": {
        "value": 92,
        "unit": "mmHg",
        "system": "http://unitsofmeasure.org",
        "code": "mm[Hg]"
      },
      "interpretation": [{
        "coding": [{
          "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
          "code": "H",
          "display": "High"
        }]
      }]
    }
  ]
}
```

**Heart Rate Observation with Rhythm Qualifier:**

```json
{
  "resourceType": "Observation",
  "id": "hr-maria-20260113",
  "status": "final",
  "category": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/observation-category",
      "code": "vital-signs"
    }]
  }],
  "code": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "8867-4",
      "display": "Heart rate"
    }]
  },
  "subject": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "effectiveDateTime": "2026-01-13T11:47:00-06:00",
  "valueQuantity": {
    "value": 98,
    "unit": "beats/min",
    "system": "http://unitsofmeasure.org",
    "code": "/min"
  },
  "interpretation": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
      "code": "A",
      "display": "Abnormal"
    }]
  }],
  "note": [{
    "text": "Irregularly irregular rhythm on palpation"
  }],
  "component": [{
    "code": {
      "coding": [{
        "system": "http://snomed.info/sct",
        "code": "301141002",
        "display": "Finding of heart rhythm"
      }]
    },
    "valueCodeableConcept": {
      "coding": [{
        "system": "http://snomed.info/sct",
        "code": "61086009",
        "display": "Irregular heart beat"
      }]
    }
  }]
}
```

### Condition Resource - New AFib Diagnosis

```json
{
  "resourceType": "Condition",
  "id": "afib-maria-20260113",
  "clinicalStatus": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code": "active"
    }]
  },
  "verificationStatus": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code": "confirmed"
    }]
  },
  "category": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/condition-category",
      "code": "encounter-diagnosis",
      "display": "Encounter Diagnosis"
    }]
  }],
  "severity": {
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "6736007",
      "display": "Moderate"
    }]
  },
  "code": {
    "coding": [
      {
        "system": "http://hl7.org/fhir/sid/icd-10-cm",
        "code": "I48.91",
        "display": "Unspecified atrial fibrillation"
      },
      {
        "system": "http://snomed.info/sct",
        "code": "49436004",
        "display": "Atrial fibrillation"
      }
    ],
    "text": "Atrial fibrillation"
  },
  "subject": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "encounter": {
    "reference": "Encounter/encounter-20260113-maria"
  },
  "onsetDateTime": "2026-01-06",
  "recordedDate": "2026-01-13",
  "recorder": {
    "reference": "Practitioner/dr-sarah-chen"
  },
  "asserter": {
    "reference": "Practitioner/dr-sarah-chen"
  },
  "evidence": [{
    "code": [{
      "coding": [{
        "system": "http://snomed.info/sct",
        "code": "80313002",
        "display": "Palpitations"
      }]
    }]
  }],
  "note": [{
    "text": "New-onset atrial fibrillation discovered on same-day visit. EKG confirms irregularly irregular rhythm without P waves. CHA2DS2-VASc score 3, anticoagulation initiated."
  }]
}
```

---

<a id="figure-22-doc-to-data"></a>

## 2.3 Clinical Terminology Mapping

<a id="table-82-icd10-codes"></a>

### Diagnosis Codes

Dr. Chen selected **I48.91 - Unspecified atrial fibrillation** as the primary ICD-10-CM diagnosis code. Let's explore why this choice matters and how it maps across terminology systems:

**ICD-10-CM Atrial Fibrillation Codes:**

| Code | Description | When to Use |
|------|-------------|-------------|
| I48.0 | Paroxysmal atrial fibrillation | Episodes that self-terminate <7 days |
| I48.1 | Persistent atrial fibrillation | Sustained >7 days, requires intervention |
| I48.2 | Chronic atrial fibrillation | Long-standing persistent or permanent |
| I48.20 | Chronic atrial fibrillation, unspecified | Chronic, type not specified |
| I48.21 | Permanent atrial fibrillation | Treatment goal is rate control only |
| **I48.91** | **Unspecified atrial fibrillation** | **Type unknown or first diagnosis** |

Dr. Chen chose I48.91 because:
1. This is Maria's first diagnosis of AFib
2. We don't yet know if it's paroxysmal or persistent
3. Cardiology follow-up will determine the specific type

<a id="table-22-icd10-snomed-mapping"></a>

**Table 2.2: ICD-10-CM to SNOMED CT Mapping**

| Terminology | Code | Display Name |
|-------------|------|--------------|
| ICD-10-CM | I48.91 | Unspecified atrial fibrillation |
| SNOMED CT | 49436004 | Atrial fibrillation |
| OMOP Concept | 313217 | Atrial fibrillation |
| MeSH | D001281 | Atrial Fibrillation |
| Read Code | G573.00 | Atrial fibrillation |

### Vital Signs LOINC Codes

<a id="table-21-vital-signs-loinc"></a>

**Table 2.1: Vital Signs with LOINC Codes**

| Measurement | LOINC Code | Component Name |
|-------------|------------|----------------|
| Blood Pressure Panel | 85354-9 | Blood pressure panel with all children optional |
| Systolic BP | 8480-6 | Systolic blood pressure |
| Diastolic BP | 8462-4 | Diastolic blood pressure |
| Heart Rate | 8867-4 | Heart rate |
| Respiratory Rate | 9279-1 | Respiratory rate |
| Body Temperature | 8310-5 | Body temperature |
| Oxygen Saturation | 2708-6 | Oxygen saturation in Arterial blood |
| Body Weight | 29463-7 | Body weight |
| Body Height | 8302-2 | Body height |
| BMI | 39156-5 | Body mass index (BMI) |
| Glucose (random) | 2339-0 | Glucose [Mass/volume] in Blood |

---

<a id="table-23-omop-condition"></a>

## 2.4 OMOP CDM Mapping

### Visit Occurrence

The encounter maps to the OMOP visit_occurrence table:

```sql
INSERT INTO visit_occurrence (
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
    9202,                    -- Outpatient Visit
    '2026-01-13',
    '2026-01-13 11:30:00',
    '2026-01-13',
    '2026-01-13 13:00:00',
    44818518,                -- Visit derived from EHR
    101,                     -- Dr. Chen's provider_id
    1,                       -- CHC main clinic
    'encounter-20260113-maria',
    0                        -- No source concept
);
```

### Condition Occurrence

```sql
INSERT INTO condition_occurrence (
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
    313217,                  -- Atrial fibrillation (SNOMED)
    '2026-01-13',            -- Diagnosis date
    '2026-01-13 12:18:00',   -- Time of EKG confirmation
    NULL,                    -- End date unknown (ongoing)
    NULL,
    32817,                   -- EHR problem list entry
    NULL,                    -- Status
    NULL,
    101,                     -- Dr. Chen
    1001,                    -- Visit occurrence
    NULL,
    'I48.91',                -- Source ICD-10 code
    45572061                 -- ICD-10 concept for I48.91
);
```

### Measurement (Vital Signs)

```sql
-- Blood Pressure - Systolic
INSERT INTO measurement (
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
    3001,
    12345,
    3004249,                 -- Systolic BP concept
    '2026-01-13',
    '2026-01-13 11:47:00',
    '11:47:00',
    44818701,                -- From physical exam
    NULL,
    148,                     -- Value
    NULL,
    8876,                    -- mmHg
    90,                      -- Normal low
    120,                     -- Normal high
    102,                     -- Lisa Brown RN
    1001,
    NULL,
    '8480-6',                -- LOINC code
    3004249,
    'mmHg',
    '148'
);

-- Random Glucose
INSERT INTO measurement (
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
    3010,
    12345,
    3004501,                 -- Glucose concept
    '2026-01-13',
    '2026-01-13 11:50:00',
    44818702,                -- From lab test
    218,                     -- Value
    8840,                    -- mg/dL
    70,                      -- Normal low
    140,                     -- Normal high (random)
    102,                     -- Lisa Brown RN
    1001,
    '2339-0',                -- LOINC
    'mg/dL'
);
```

**Live Query Results: Vital Signs from Maria's PCP Visit**

After loading the teaching dataset, querying the measurement table for Maria's vital signs returns:

```sql
-- Query: Vital Signs from PCP Visit (January 13, 2026)
SELECT
    c.concept_name AS measurement,
    m.value_as_number AS value,
    u.concept_name AS unit,
    m.measurement_source_value AS loinc_code
FROM cdm.measurement m
JOIN vocabulary.concept c ON m.measurement_concept_id = c.concept_id
LEFT JOIN vocabulary.concept u ON m.unit_concept_id = u.concept_id
WHERE m.person_id = 12345
  AND m.visit_occurrence_id = 900001
ORDER BY m.measurement_datetime;
```

<div align="center">

| Measurement | Value | Unit | LOINC Code |
|:------------|------:|:-----|:----------:|
| Respiratory rate | 18 | counts per minute | 9279-1 |
| Heart rate | 98 | per minute | 8867-4 |
| Oxygen saturation in Arterial blood by Pulse oximetry | 97 | percent | 2708-6 |
| Body height | 162.56 | centimeter | 8302-2 |
| Body weight | 187 | pound (US) | 29463-7 |
| Glucose [Mass/volume] in Serum or Plasma | 218 | milligram per deciliter | 2339-0 |
| Diastolic blood pressure | 92 | millimeter mercury column | 8462-4 |
| Systolic blood pressure | 148 | millimeter mercury column | 8480-6 |
| Body mass index (BMI) [Ratio] | 32.1 | kilogram per square meter | 39156-5 |
| Body temperature | 98.4 | degree Celsius | 8310-5 |

*Query returned 10 rows*

</div>

**Clinical Interpretation of Query Results:**

The query results reveal concerning findings that prompted Dr. Chen's clinical response:
- **Blood Pressure 148/92 mmHg**: Stage 2 hypertension (above 140/90 threshold)
- **Heart Rate 98 bpm**: Elevated and irregular (noted as "irregularly irregular" on exam)
- **Random Glucose 218 mg/dL**: Significantly elevated (normal <140 random)
- **BMI 32.1 kg/m²**: Obese Class I

These findings, combined with Maria's history of diabetes and hypertension, triggered the clinical decision support alert and justified same-day EKG that confirmed atrial fibrillation.

**Live Query Results: Active Conditions with ICD-10 to SNOMED Mapping**

```sql
-- Query: Conditions with Source-to-Standard Concept Mapping
SELECT
    co.condition_start_date AS onset_date,
    c.concept_name AS condition_snomed,
    co.condition_source_value AS icd10_code,
    sc.concept_name AS icd10_description
FROM cdm.condition_occurrence co
JOIN vocabulary.concept c ON co.condition_concept_id = c.concept_id
LEFT JOIN vocabulary.concept sc ON co.condition_source_concept_id = sc.concept_id
WHERE co.person_id = 12345
ORDER BY co.condition_start_date;
```

<div align="center">

| Onset Date | Condition (SNOMED) | ICD-10 Code | ICD-10 Description |
|:----------:|:-------------------|:-----------:|:-------------------|
| 2021-03-10 | Essential hypertension | I10 | Essential (primary) hypertension |
| 2021-03-10 | Obesity | E66.9 | Obesity, unspecified |
| 2023-01-15 | Type 2 diabetes mellitus | E11.9 | Type 2 diabetes without comp. |
| 2026-01-13 | Atrial fibrillation | I48.91 | Unspecified atrial fibrillation |

*Query returned 4 rows*

</div>

This demonstrates the OMOP vocabulary mapping: source ICD-10-CM codes (condition_source_value) are mapped to standard SNOMED CT concepts (condition_concept_id), enabling consistent querying across systems that may use different source terminologies.

---

## 2.5 Cohort Design & Phenotyping

### Phenotype: New Atrial Fibrillation Diagnosis

Let's create a phenotype definition for identifying patients with newly diagnosed atrial fibrillation:

```yaml
Phenotype: new_onset_atrial_fibrillation
Version: 1.0
Author: CHC Informatics Team
Description: |
  Identifies patients with a new diagnosis of atrial fibrillation,
  defined as first occurrence of AFib diagnosis with no prior
  AFib diagnosis in the 365-day lookback period.

Inclusion Criteria:
  - condition:
      concept_set: atrial_fibrillation
      include_descendants: true
  - temporal:
      first_occurrence: true

Exclusion Criteria:
  - condition:
      concept_set: atrial_fibrillation
      time_window: prior_365_days

Concept Set - atrial_fibrillation:
  - concept_id: 313217 (Atrial fibrillation)
  - include_descendants: true

Output:
  - person_id
  - condition_start_date (index_date)
  - age_at_diagnosis
  - gender
  - prior_conditions (HTN, DM, CHF, stroke)
```

**OMOP SQL Implementation:**

```sql
-- Phenotype: New-Onset Atrial Fibrillation
-- Identifies first AFib diagnosis with no prior history

WITH afib_concept_set AS (
    -- Get all descendant concepts for atrial fibrillation
    SELECT DISTINCT descendant_concept_id AS concept_id
    FROM concept_ancestor
    WHERE ancestor_concept_id = 313217

    UNION

    SELECT 313217 AS concept_id
),
first_afib AS (
    -- Find first AFib diagnosis per patient
    SELECT
        co.person_id,
        MIN(co.condition_start_date) AS first_afib_date
    FROM condition_occurrence co
    INNER JOIN afib_concept_set acs
        ON co.condition_concept_id = acs.concept_id
    GROUP BY co.person_id
),
patients_with_prior_afib AS (
    -- Identify patients with AFib before their "first" diagnosis
    -- (to handle data from before observation period)
    SELECT DISTINCT f.person_id
    FROM first_afib f
    INNER JOIN condition_occurrence co
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
    INNER JOIN person p ON f.person_id = p.person_id
    WHERE f.person_id NOT IN (SELECT person_id FROM patients_with_prior_afib)
)
SELECT
    noa.*,
    -- Check for HTN in prior year
    CASE WHEN EXISTS (
        SELECT 1 FROM condition_occurrence co
        WHERE co.person_id = noa.person_id
          AND co.condition_concept_id IN (320128, 316866) -- HTN concepts
          AND co.condition_start_date BETWEEN
              noa.index_date - INTERVAL '365 days' AND noa.index_date
    ) THEN 1 ELSE 0 END AS has_prior_htn,
    -- Check for DM in prior year
    CASE WHEN EXISTS (
        SELECT 1 FROM condition_occurrence co
        WHERE co.person_id = noa.person_id
          AND co.condition_concept_id IN (
              SELECT descendant_concept_id
              FROM concept_ancestor
              WHERE ancestor_concept_id = 201826
          )
          AND co.condition_start_date BETWEEN
              noa.index_date - INTERVAL '365 days' AND noa.index_date
    ) THEN 1 ELSE 0 END AS has_prior_dm
FROM new_onset_afib_cohort noa
WHERE noa.index_date BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY noa.index_date;
```

---

## 2.6 Chapter 2 Mindmap: Clinical Encounter Workflow

<a id="figure-21-encounter-flow"></a>

![Clinical Encounter Workflow](../assets/infographics/04_clinical_encounter_workflow.svg)

*Figure 2.1: Clinical Encounter Workflow — Maria's office visit from nursing intake through provider exam, diagnosis, CDS firing, and data generation across multiple systems*

---

## 2.7 Chapter Summary: Key Takeaways

### Clinical Practice Insights

1. **Vital signs are diagnostic tools:** Lisa's detection of an irregular pulse led directly to the AFib diagnosis. Vital signs aren't just numbers to document—they're clinical findings that guide care.

2. **Chief complaint doesn't always tell the whole story:** Maria came in for diabetes follow-up with fatigue. The palpitations she mentioned almost as an afterthought turned out to be the most clinically significant finding.

3. **Clinical decision support guides evidence-based care:** The CHA₂DS₂-VASc score calculation ensured Maria received appropriate stroke prevention therapy based on current guidelines.

4. **Documentation is clinical care:** Dr. Chen's SOAP note isn't just paperwork—it communicates clinical reasoning to other providers, justifies treatment decisions, and creates a legal record of care delivered.

### Technical Implementation Insights

1. **Structured data capture:** Vital signs recorded through the EHR become discrete, queryable data elements with LOINC codes and UCUM units.

2. **Multi-terminology diagnosis coding:** A single diagnosis (atrial fibrillation) maps to ICD-10-CM for billing, SNOMED CT for clinical interoperability, and OMOP concepts for research.

3. **FHIR resource ecosystem:** The encounter generates interconnected resources (Patient, Encounter, Observation, Condition, MedicationRequest) that together represent the clinical story.

### Standards Mapping Summary

| Clinical Event | LOINC | ICD-10-CM | SNOMED CT | OMOP |
|---------------|-------|-----------|-----------|------|
| Blood Pressure | 85354-9 | — | — | 3004249 (sys) |
| Heart Rate | 8867-4 | — | — | 3027018 |
| Random Glucose | 2339-0 | — | — | 3004501 |
| Atrial Fibrillation | — | I48.91 | 49436004 | 313217 |
| Diabetes Mellitus | — | E11.9 | 44054006 | 201826 |
| Hypertension | — | I10 | 38341003 | 320128 |

### Looking Ahead

In Chapter 3, we follow Maria through the diagnostic workup that Dr. Chen ordered: laboratory tests, imaging studies, and the complex data flows that connect ordering, resulting, and clinical interpretation. We'll see how CPOE (Computerized Provider Order Entry) generates HL7 ORM messages, how lab interfaces return ORU results, and how this data populates the OMOP measurement table for research.

The clinical encounter captures the "what" of Maria's visit. The diagnostic workup will reveal the "why"—the objective data that confirms diagnoses, guides treatment, and enables evidence-based care.

---

## 2.8 Interesting Facts

<div style="background-color: #fff3cd; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **Atrial Fibrillation Prevalence:** AFib affects approximately **6 million Americans**, with prevalence expected to double by 2050. It's the most common sustained cardiac arrhythmia and accounts for approximately 750,000 hospitalizations annually.

2. **The "Holiday Heart":** The term "Holiday Heart Syndrome" was coined in 1978 to describe AFib that occurs after binge drinking. Studies show alcohol increases AFib risk by **8% per drink per day**, making Lisa's assessment of Maria's social alcohol use clinically relevant.

3. **SOAP Notes Origin:** The SOAP note format was developed by **Dr. Lawrence Weed** at the University of Vermont in the 1960s as part of the Problem-Oriented Medical Record (POMR). It was revolutionary for its time and remains the dominant documentation format 60 years later.

4. **The CHA₂DS₂-VASc Score:** This scoring system was developed at the **University of Birmingham, UK** in 2010 as an improvement over the older CHADS₂ score. The subscript numbers indicate point values: C=1, H=1, A₂=2, D=1, S₂=2, V=1, A=1, Sc=1.

5. **Stroke Risk Without Treatment:** A CHA₂DS₂-VASc score of 3 (like Maria's) corresponds to an annual stroke risk of approximately **3.2%**. Without anticoagulation, Maria would have roughly a 1 in 30 chance of stroke each year.

6. **The First EKG:** The electrocardiogram was invented by **Willem Einthoven** in 1903, who won the Nobel Prize for his work in 1924. The original machine weighed 600 pounds and required water cooling!

7. **ICD-10 Specificity:** The ICD-10 coding system contains over **70,000 diagnosis codes**—compared to approximately 14,000 in ICD-9. This increased specificity allows for better clinical detail but requires more precise documentation.

</div>

---

## 2.9 References & Sources

### Clinical Guidelines

1. **January CT, Wann LS, et al.** (2019). 2019 AHA/ACC/HRS Focused Update of the 2014 AHA/ACC/HRS Guideline for the Management of Patients With Atrial Fibrillation. *Circulation*, 140(2), e125-e151. https://doi.org/10.1161/CIR.0000000000000665

2. **Lip GYH, et al.** (2010). Refining Clinical Risk Stratification for Predicting Stroke and Thromboembolism in Atrial Fibrillation Using a Novel Risk Factor-Based Approach: The Euro Heart Survey on Atrial Fibrillation. *Chest*, 137(2), 263-272. https://doi.org/10.1378/chest.09-1584

3. **Pisters R, et al.** (2010). A Novel User-Friendly Score (HAS-BLED) To Assess 1-Year Risk of Major Bleeding in Patients With Atrial Fibrillation: The Euro Heart Survey. *Chest*, 138(5), 1093-1100.

### Technical Standards

4. **Regenstrief Institute.** (2024). *LOINC Version 2.76 User Guide*. https://loinc.org/get-started/loinc-manual/

5. **SNOMED International.** (2024). *SNOMED CT Starter Guide*. https://www.snomed.org/snomed-ct/five-step-briefing

6. **HL7 International.** (2024). *FHIR R4 Observation Resource*. http://hl7.org/fhir/R4/observation.html

7. **HL7 International.** (2024). *FHIR R4 Condition Resource*. http://hl7.org/fhir/R4/condition.html

8. **OHDSI.** (2024). *OMOP CDM v5.4: CONDITION_OCCURRENCE Table*. https://ohdsi.github.io/CommonDataModel/cdm54.html#CONDITION_OCCURRENCE

### Clinical Documentation

9. **Weed LL.** (1968). Medical records that guide and teach. *New England Journal of Medicine*, 278(11), 593-600. https://doi.org/10.1056/NEJM196803142781105

10. **Rosenbloom ST, et al.** (2011). Data from clinical notes: a perspective on the tension between structure and flexible documentation. *Journal of the American Medical Informatics Association*, 18(2), 181-186.

### Epidemiology

11. **CDC.** (2024). *Atrial Fibrillation Fact Sheet*. Centers for Disease Control and Prevention. https://www.cdc.gov/heartdisease/atrial_fibrillation.htm

12. **Benjamin EJ, et al.** (2019). Heart Disease and Stroke Statistics—2019 Update. *Circulation*, 139(10), e56-e528.

---

<div style="page-break-after: always;"></div>

---

# Chapter 3: Diagnostic Workup & Orders

## 3.1 Clinical Narrative

### Monday, January 13, 2026 — 12:45 PM

Dr. Chen completed her documentation and turned to the EHR's order entry system. Maria's new atrial fibrillation diagnosis required a systematic workup to identify underlying causes and establish baseline values before starting anticoagulation.

"Maria, I'm going to order some blood tests and schedule you for an echocardiogram—that's an ultrasound of your heart. The blood tests will check your thyroid function, since an overactive thyroid can cause AFib, and we'll get a baseline on your blood counts and kidney function before starting the blood thinner."

Maria nodded. "Can I get the blood drawn today?"

"Absolutely. Our lab is right down the hall. And I've marked the echocardiogram as urgent, so the cardiology office should call you within a day or two to schedule it."

---

### Computerized Provider Order Entry (CPOE)

Dr. Chen navigated to the Orders tab in the EHR. The system presented her with several options:

1. **Order Sets:** Pre-built bundles of orders for common clinical scenarios
2. **Individual Orders:** Search for specific tests, medications, or referrals
3. **Favorites:** Her personally curated list of frequently used orders
4. **Recent Orders:** Orders she had placed recently for quick re-ordering

She selected the "Atrial Fibrillation - New Diagnosis Workup" order set, which automatically populated the following orders:

<a id="table-31-lab-tests"></a>

**Table 3.1: Laboratory Tests Ordered**

**Laboratory Orders:**

| Test | LOINC Code | Priority | Clinical Rationale |
|------|------------|----------|-------------------|
| TSH | 3016-3 | Routine | Rule out hyperthyroidism |
| CBC with Differential | 58410-2 | Routine | Baseline, rule out anemia |
| Comprehensive Metabolic Panel | 24323-8 | Routine | Renal/hepatic function baseline |
| PT/INR | 5902-2 | Routine | Baseline coagulation |
| Lipid Panel | 24331-1 | Routine | Cardiovascular risk |
| Magnesium | 2601-3 | Routine | Rule out hypomagnesemia |

**Diagnostic Imaging:**

| Study | CPT Code | Priority | Clinical Rationale |
|-------|----------|----------|-------------------|
| Echocardiogram, TTE | 93306 | Urgent | Assess LV function, valve disease, LA size |

**Medications (already ordered during encounter):**

| Medication | RxNorm | Sig | Clinical Rationale |
|------------|--------|-----|-------------------|
| Apixaban 5mg | 1364430 | 1 tab PO BID | Stroke prevention |
| Metoprolol Succinate ER 25mg | 866924 | 1 tab PO daily | Rate control |

**Referrals:**

| Referral | Specialty | Priority |
|----------|-----------|----------|
| Cardiology Consultation | Cardiology | Urgent (1-2 weeks) |

---

### The Order Entry Workflow

<a id="figure-31-lab-workflow"></a>

![Provider Order Entry Workflow](../assets/infographics/15_order_entry_workflow.svg)

*Figure 2.2: Provider Order Entry Workflow — From order entry through CDS screening, HL7 message transmission to lab, radiology, and pharmacy systems*

When Dr. Chen signed the orders, the EHR performed several background operations:

1. **Clinical Decision Support Screening:**
   - Checked for duplicate orders (Maria had a CMP drawn 4 months ago—acceptable)
   - Verified no drug allergies to new medications
   - Screened for drug-drug interactions (Apixaban + Metformin: minor interaction noted)
   - Applied appropriate use criteria for echocardiogram (new AFib = appropriate)

2. **Order Transmission:**
   - Lab orders → HL7 ORM^O01 message → Quest Diagnostics interface
   - Imaging orders → HL7 ORM^O01 message → Radiology Information System (RIS)
   - Pharmacy orders → HL7 RDE^O01 message → Pharmacy system → E-prescribe to pharmacy

3. **Worklist Updates:**
   - Lab requisition added to phlebotomy worklist
   - Echo study added to cardiology imaging schedule queue
   - Referral added to cardiology new patient scheduler queue

---

### HL7 v2 Order Message (ORM^O01)

When the lab orders were signed, the EHR generated this HL7 v2.5 message:

```
MSH|^~\&|CLINICEHR|CHC|QUESTLAB|QUEST|20260113125000||ORM^O01^ORM_O01|MSG00234|P|2.5.1
PID|1||12345^^^CHC^MR||RODRIGUEZ^MARIA||19790315|F|||123 MAIN ST^^SPRINGFIELD^IL^62701
PV1|1|O|CHC-MAIN^^^^OUTPATIENT|||1234567890^CHEN^SARAH^^^^^MD
IN1|1|MC|IL-MERIDIAN|MERIDIAN HEALTH PLAN|||||||||||RODRIGUEZ^MARIA
ORC|NW|ORD-20260113-001||||||^^^^^R^^20260113125000|20260113125000|1234567890^CHEN^SARAH^^^^^MD||||CHC-MAIN
OBR|1|ORD-20260113-001||3016-3^TSH^LN|||20260113125000||||||||1234567890^CHEN^SARAH^^^^^MD||||||20260113|||F
ORC|NW|ORD-20260113-002||||||^^^^^R^^20260113125000|20260113125000|1234567890^CHEN^SARAH^^^^^MD||||CHC-MAIN
OBR|2|ORD-20260113-002||58410-2^CBC with Differential^LN|||20260113125000||||||||1234567890^CHEN^SARAH^^^^^MD||||||20260113|||F
ORC|NW|ORD-20260113-003||||||^^^^^R^^20260113125000|20260113125000|1234567890^CHEN^SARAH^^^^^MD||||CHC-MAIN
OBR|3|ORD-20260113-003||24323-8^Comprehensive Metabolic Panel^LN|||20260113125000||||||||1234567890^CHEN^SARAH^^^^^MD||||||20260113|||F
ORC|NW|ORD-20260113-004||||||^^^^^R^^20260113125000|20260113125000|1234567890^CHEN^SARAH^^^^^MD||||CHC-MAIN
OBR|4|ORD-20260113-004||5902-2^PT/INR^LN|||20260113125000||||||||1234567890^CHEN^SARAH^^^^^MD||||||20260113|||F
ORC|NW|ORD-20260113-005||||||^^^^^R^^20260113125000|20260113125000|1234567890^CHEN^SARAH^^^^^MD||||CHC-MAIN
OBR|5|ORD-20260113-005||24331-1^Lipid Panel^LN|||20260113125000||||||||1234567890^CHEN^SARAH^^^^^MD||||||20260113|||F
ORC|NW|ORD-20260113-006||||||^^^^^R^^20260113125000|20260113125000|1234567890^CHEN^SARAH^^^^^MD||||CHC-MAIN
OBR|6|ORD-20260113-006||2601-3^Magnesium^LN|||20260113125000||||||||1234567890^CHEN^SARAH^^^^^MD||||||20260113|||F
```

**Message Breakdown:**

- **MSH (Message Header):** Identifies sender (CLINICEHR at CHC), receiver (QUESTLAB), message type (ORM^O01 = Order Message)
- **PID (Patient Identification):** Maria's demographics
- **PV1 (Patient Visit):** Outpatient visit at CHC main clinic
- **IN1 (Insurance):** Medicaid coverage information
- **ORC (Common Order):** Order control segment - "NW" = New Order
- **OBR (Observation Request):** The actual test ordered, identified by LOINC code

---

### Specimen Collection

Maria walked down the hall to the lab draw station. The phlebotomist, Juan Martinez, scanned Maria's wristband (applied at registration) and pulled up the pending orders on his workstation.

"Ms. Rodriguez, I see we're collecting several tubes today. This will be a few vials, but we'll get it done in one stick."

Juan prepared his supplies:
- **Gold top (SST):** For TSH, CMP, lipids
- **Lavender top (EDTA):** For CBC with differential
- **Light blue top (citrate):** For PT/INR
- **Green top (lithium heparin):** For magnesium

After successful venipuncture, Juan labeled each tube with barcodes linking them to Maria's order numbers, then logged the collection in the LIS (Laboratory Information System):

```
SPECIMEN COLLECTION LOG
Date/Time: 01/13/2026 13:15
Patient: Rodriguez, Maria (MRN: 12345)
Collected by: Juan Martinez, Phlebotomist
Site: Left antecubital
Tubes collected: 4 (Gold SST, Lavender EDTA, Light Blue Citrate, Green LiHep)
Order Numbers: ORD-20260113-001 through ORD-20260113-006
Status: Collected, pending transport to Quest
```

---

<a id="table-33-lab-results"></a>

## 3.2 Lab Results Return

### Tuesday, January 14, 2026 — 2:00 PM

The following afternoon, Quest Diagnostics transmitted Maria's lab results back to Community Health Clinic via HL7 ORU^R01 message:

```
MSH|^~\&|QUESTLAB|QUEST|CLINICEHR|CHC|20260114140000||ORU^R01^ORU_R01|MSG00567|P|2.5.1
PID|1||12345^^^CHC^MR||RODRIGUEZ^MARIA||19790315|F
ORC|RE|ORD-20260113-001|||CM||||20260114140000|||1234567890^CHEN^SARAH^^^^^MD
OBR|1|ORD-20260113-001||3016-3^TSH^LN|||20260113131500|||||||20260114100000||||||||20260114140000|||F
OBX|1|NM|3016-3^TSH^LN||1.8|mIU/L|0.4-4.0||||F|||20260114100000
ORC|RE|ORD-20260113-002|||CM||||20260114140000|||1234567890^CHEN^SARAH^^^^^MD
OBR|2|ORD-20260113-002||58410-2^CBC with Differential^LN|||20260113131500|||||||20260114100000||||||||20260114140000|||F
OBX|1|NM|718-7^Hemoglobin^LN||12.8|g/dL|12.0-16.0||||F|||20260114100000
OBX|2|NM|4544-3^Hematocrit^LN||38.2|%|36.0-46.0||||F|||20260114100000
OBX|3|NM|6690-2^WBC^LN||7.2|10*3/uL|4.5-11.0||||F|||20260114100000
OBX|4|NM|777-3^Platelets^LN||245|10*3/uL|150-400||||F|||20260114100000
OBX|5|NM|789-8^RBC^LN||4.52|10*6/uL|4.0-5.5||||F|||20260114100000
OBX|6|NM|787-2^MCV^LN||84.5|fL|80-100||||F|||20260114100000
OBX|7|NM|785-6^MCH^LN||28.3|pg|27-33||||F|||20260114100000
OBX|8|NM|786-4^MCHC^LN||33.5|g/dL|32-36||||F|||20260114100000
OBX|9|NM|788-0^RDW^LN||13.2|%|11.5-14.5||||F|||20260114100000
ORC|RE|ORD-20260113-003|||CM||||20260114140000
OBR|3|ORD-20260113-003||24323-8^Comprehensive Metabolic Panel^LN|||20260113131500|||||||20260114100000||||||||20260114140000|||F
OBX|1|NM|2345-7^Glucose^LN||142|mg/dL|70-100|H|||F|||20260114100000
OBX|2|NM|3094-0^BUN^LN||18|mg/dL|7-20||||F|||20260114100000
OBX|3|NM|2160-0^Creatinine^LN||0.9|mg/dL|0.6-1.2||||F|||20260114100000
OBX|4|NM|98979-8^eGFR^LN||82|mL/min/1.73m2|>60||||F|||20260114100000
OBX|5|NM|2951-2^Sodium^LN||140|mEq/L|136-145||||F|||20260114100000
OBX|6|NM|2823-3^Potassium^LN||4.2|mEq/L|3.5-5.0||||F|||20260114100000
OBX|7|NM|2075-0^Chloride^LN||102|mEq/L|98-106||||F|||20260114100000
OBX|8|NM|2028-9^CO2^LN||24|mEq/L|22-29||||F|||20260114100000
OBX|9|NM|17861-6^Calcium^LN||9.4|mg/dL|8.5-10.5||||F|||20260114100000
OBX|10|NM|2885-2^Total Protein^LN||7.2|g/dL|6.0-8.3||||F|||20260114100000
OBX|11|NM|1751-7^Albumin^LN||4.1|g/dL|3.5-5.0||||F|||20260114100000
OBX|12|NM|1975-2^Total Bilirubin^LN||0.8|mg/dL|0.1-1.2||||F|||20260114100000
OBX|13|NM|6768-6^Alkaline Phosphatase^LN||72|U/L|44-147||||F|||20260114100000
OBX|14|NM|1920-8^AST^LN||24|U/L|10-40||||F|||20260114100000
OBX|15|NM|1742-6^ALT^LN||28|U/L|7-56||||F|||20260114100000
ORC|RE|ORD-20260113-004|||CM
OBR|4|ORD-20260113-004||5902-2^PT/INR^LN|||20260113131500|||||||20260114100000||||||||20260114140000|||F
OBX|1|NM|5902-2^PT^LN||12.5|seconds|11.0-13.5||||F|||20260114100000
OBX|2|NM|6301-6^INR^LN||1.0||0.9-1.1||||F|||20260114100000
ORC|RE|ORD-20260113-005|||CM
OBR|5|ORD-20260113-005||24331-1^Lipid Panel^LN|||20260113131500|||||||20260114100000||||||||20260114140000|||F
OBX|1|NM|2093-3^Total Cholesterol^LN||218|mg/dL|<200|H|||F|||20260114100000
OBX|2|NM|2571-8^Triglycerides^LN||185|mg/dL|<150|H|||F|||20260114100000
OBX|3|NM|2085-9^HDL Cholesterol^LN||42|mg/dL|>40||||F|||20260114100000
OBX|4|NM|13457-7^LDL Cholesterol (calculated)^LN||139|mg/dL|<100|H|||F|||20260114100000
ORC|RE|ORD-20260113-006|||CM
OBR|6|ORD-20260113-006||2601-3^Magnesium^LN|||20260113131500|||||||20260114100000||||||||20260114140000|||F
OBX|1|NM|2601-3^Magnesium^LN||2.1|mg/dL|1.7-2.4||||F|||20260114100000
```

---

### Results Summary Table

| Test | Result | Units | Reference Range | Interpretation |
|------|--------|-------|-----------------|----------------|
| **TSH** | 1.8 | mIU/L | 0.4-4.0 | Normal |
| **Hemoglobin** | 12.8 | g/dL | 12.0-16.0 | Normal |
| **Hematocrit** | 38.2 | % | 36.0-46.0 | Normal |
| **WBC** | 7.2 | 10³/uL | 4.5-11.0 | Normal |
| **Platelets** | 245 | 10³/uL | 150-400 | Normal |
| **Glucose (fasting)** | 142 | mg/dL | 70-100 | **HIGH** |
| **BUN** | 18 | mg/dL | 7-20 | Normal |
| **Creatinine** | 0.9 | mg/dL | 0.6-1.2 | Normal |
| **eGFR** | 82 | mL/min/1.73m² | >60 | Normal |
| **Sodium** | 140 | mEq/L | 136-145 | Normal |
| **Potassium** | 4.2 | mEq/L | 3.5-5.0 | Normal |
| **PT** | 12.5 | seconds | 11.0-13.5 | Normal |
| **INR** | 1.0 | — | 0.9-1.1 | Normal |
| **Total Cholesterol** | 218 | mg/dL | <200 | **HIGH** |
| **Triglycerides** | 185 | mg/dL | <150 | **HIGH** |
| **HDL** | 42 | mg/dL | >40 | Normal |
| **LDL (calculated)** | 139 | mg/dL | <100 | **HIGH** |
| **Magnesium** | 2.1 | mg/dL | 1.7-2.4 | Normal |

**Clinical Interpretation:**

Dr. Chen reviewed the results and noted:

1. **TSH normal** — Rules out hyperthyroidism as cause of AFib
2. **CBC normal** — No anemia contributing to tachycardia; adequate platelets for anticoagulation
3. **Renal function normal** — Apixaban dosing appropriate (no reduction needed)
4. **Baseline INR normal** — Good baseline before anticoagulation
5. **Glucose still elevated** — Confirms suboptimal diabetes control
6. **Lipid panel abnormal** — Increased cardiovascular risk; may need statin therapy

---

<a id="table-32-loinc-panels"></a>

## 3.3 LOINC Deep Dive

### Understanding the LOINC Code System

LOINC (Logical Observation Identifiers Names and Codes) is the universal standard for identifying laboratory tests and clinical observations. Let's examine how LOINC codes are structured:

**LOINC Code Structure (6 Axes):**

```
Component: What is being measured
Property: Type of property (mass, number, ratio, etc.)
Time: Point in time vs. over time
System: Body system or specimen type
Scale: Quantitative, ordinal, nominal, etc.
Method: How the measurement is performed (optional)
```

**Example: Hemoglobin (LOINC 718-7)**

| Axis | Value | Description |
|------|-------|-------------|
| Component | Hemoglobin | The analyte being measured |
| Property | MCnc | Mass concentration |
| Time | Pt | Point in time |
| System | Bld | Blood |
| Scale | Qn | Quantitative |
| Method | — | Not specified |

**Full LOINC Name:** `Hemoglobin [Mass/volume] in Blood`

### Comprehensive Metabolic Panel Hierarchy

The CMP (LOINC 24323-8) is a panel code containing multiple child observations:

<a id="figure-32-loinc-structure"></a>

![LOINC CMP Panel Hierarchy](../assets/infographics/16_loinc_cmp_panel.svg)

*Figure 3.3: LOINC Comprehensive Metabolic Panel (CMP) — Hierarchical structure showing all 14 component tests with LOINC codes, grouped by clinical category*

---

## 3.4 FHIR Diagnostic Report

The lab results are represented in FHIR as a DiagnosticReport resource with linked Observation resources:

```json
{
  "resourceType": "DiagnosticReport",
  "id": "cmp-maria-20260114",
  "status": "final",
  "category": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v2-0074",
      "code": "LAB",
      "display": "Laboratory"
    }]
  }],
  "code": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "24323-8",
      "display": "Comprehensive metabolic panel"
    }]
  },
  "subject": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "effectiveDateTime": "2026-01-14T10:00:00-06:00",
  "issued": "2026-01-14T14:00:00-06:00",
  "performer": [{
    "reference": "Organization/quest-diagnostics"
  }],
  "result": [
    {"reference": "Observation/glucose-maria-20260114"},
    {"reference": "Observation/bun-maria-20260114"},
    {"reference": "Observation/creatinine-maria-20260114"},
    {"reference": "Observation/egfr-maria-20260114"},
    {"reference": "Observation/sodium-maria-20260114"},
    {"reference": "Observation/potassium-maria-20260114"},
    {"reference": "Observation/chloride-maria-20260114"},
    {"reference": "Observation/co2-maria-20260114"},
    {"reference": "Observation/calcium-maria-20260114"},
    {"reference": "Observation/protein-maria-20260114"},
    {"reference": "Observation/albumin-maria-20260114"},
    {"reference": "Observation/bilirubin-maria-20260114"},
    {"reference": "Observation/alp-maria-20260114"},
    {"reference": "Observation/ast-maria-20260114"},
    {"reference": "Observation/alt-maria-20260114"}
  ]
}
```

**Individual Observation Resource (Glucose - Abnormal):**

```json
{
  "resourceType": "Observation",
  "id": "glucose-maria-20260114",
  "status": "final",
  "category": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/observation-category",
      "code": "laboratory"
    }]
  }],
  "code": {
    "coding": [{
      "system": "http://loinc.org",
      "code": "2345-7",
      "display": "Glucose [Mass/volume] in Serum or Plasma"
    }]
  },
  "subject": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "effectiveDateTime": "2026-01-14T10:00:00-06:00",
  "valueQuantity": {
    "value": 142,
    "unit": "mg/dL",
    "system": "http://unitsofmeasure.org",
    "code": "mg/dL"
  },
  "interpretation": [{
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
      "code": "H",
      "display": "High"
    }]
  }],
  "referenceRange": [{
    "low": {
      "value": 70,
      "unit": "mg/dL"
    },
    "high": {
      "value": 100,
      "unit": "mg/dL"
    },
    "text": "70-100 mg/dL"
  }]
}
```

---

## 3.5 OMOP CDM Mapping

### Measurement Table Population

```sql
-- Insert lab results into OMOP measurement table
INSERT INTO measurement (
    measurement_id, person_id, measurement_concept_id,
    measurement_date, measurement_datetime, measurement_type_concept_id,
    value_as_number, unit_concept_id, range_low, range_high,
    provider_id, visit_occurrence_id,
    measurement_source_value, measurement_source_concept_id, unit_source_value
) VALUES
-- TSH
(4001, 12345, 3019701, '2026-01-14', '2026-01-14 10:00:00',
 32856, 1.8, 8549, 0.4, 4.0, 101, 1001, '3016-3', 3019701, 'mIU/L'),
-- Hemoglobin
(4002, 12345, 3000963, '2026-01-14', '2026-01-14 10:00:00',
 32856, 12.8, 8713, 12.0, 16.0, 101, 1001, '718-7', 3000963, 'g/dL'),
-- Glucose
(4003, 12345, 3004501, '2026-01-14', '2026-01-14 10:00:00',
 32856, 142, 8840, 70, 100, 101, 1001, '2345-7', 3004501, 'mg/dL'),
-- Creatinine
(4004, 12345, 3016723, '2026-01-14', '2026-01-14 10:00:00',
 32856, 0.9, 8840, 0.6, 1.2, 101, 1001, '2160-0', 3016723, 'mg/dL'),
-- eGFR
(4005, 12345, 46236952, '2026-01-14', '2026-01-14 10:00:00',
 32856, 82, 8698, 60, NULL, 101, 1001, '98979-8', 46236952, 'mL/min/1.73m2'),
-- Total Cholesterol
(4006, 12345, 3027114, '2026-01-14', '2026-01-14 10:00:00',
 32856, 218, 8840, NULL, 200, 101, 1001, '2093-3', 3027114, 'mg/dL'),
-- LDL Cholesterol
(4007, 12345, 3028437, '2026-01-14', '2026-01-14 10:00:00',
 32856, 139, 8840, NULL, 100, 101, 1001, '13457-7', 3028437, 'mg/dL');
```

**Live Query Results: Lab Results from OMOP CDM**

Querying Maria's lab results demonstrates how laboratory data is stored and retrieved in the OMOP measurement table:

```sql
-- Query: Lab Results (Type = 32856 indicates lab result)
SELECT
    m.measurement_date,
    c.concept_name AS lab_test,
    m.value_as_number AS result,
    u.concept_name AS unit,
    CONCAT(m.range_low, '-', m.range_high) AS reference_range,
    m.measurement_source_value AS loinc_code
FROM cdm.measurement m
JOIN vocabulary.concept c ON m.measurement_concept_id = c.concept_id
LEFT JOIN vocabulary.concept u ON m.unit_concept_id = u.concept_id
WHERE m.person_id = 12345
  AND m.measurement_type_concept_id = 32856  -- Lab results only
ORDER BY m.measurement_date, c.concept_name;
```

<div align="center">

| Date | Lab Test | Result | Unit | Reference Range | LOINC |
|:----:|:---------|-------:|:-----|:---------------:|:-----:|
| 2026-01-10 | Creatinine [Mass/volume] in Serum or Plasma | 0.9 | milligram per deciliter | 0.6-1.2 | 2160-0 |
| 2026-01-10 | Glomerular filtration rate/1.73 sq M (MDRD) | 65 | per microliter | 60-120 | 98979-8 |
| 2026-01-10 | Glucose [Mass/volume] in Serum or Plasma | 162 | milligram per deciliter | 70-100 | 2339-0 |
| 2026-01-10 | Hemoglobin A1c [Mass/volume] in Blood | 8.2 | percent | 4.0-5.6 | 4548-4 |
| 2026-01-16 | Hematocrit [Volume Fraction] of Blood | 38.2 | percent | 36-46 | 4544-3 |
| 2026-01-16 | Hemoglobin [Mass/volume] in Blood | 12.8 | gram per deciliter | 12.0-16.0 | 718-7 |
| 2026-01-16 | Leukocytes [#/volume] in Blood | 7.2 | cells per microliter | 4.5-11.0 | 6690-2 |
| 2026-01-16 | Platelets [#/volume] in Blood | 245 | cells per microliter | 150-400 | 777-3 |
| 2026-01-16 | TSH [Units/volume] in Serum or Plasma | 1.8 | microgram per deciliter | 0.4-4.0 | 3016-3 |

*Query returned 9 rows*

</div>

**Clinical Interpretation of Lab Results:**

| Test | Result | Interpretation | Clinical Implication |
|------|--------|----------------|---------------------|
| **HbA1c 8.2%** | Elevated | Above 7% goal | Diabetes not optimally controlled; intensify therapy |
| **Fasting Glucose 162** | Elevated | >100 mg/dL | Confirms poor glycemic control |
| **TSH 1.8** | Normal | 0.4-4.0 range | Rules out hyperthyroidism as AFib cause |
| **eGFR 65** | Normal | >60 mL/min | No Apixaban dose reduction needed |
| **CBC** | Normal | All values normal | No anemia or infection contributing to symptoms |

The normal TSH is clinically significant—hyperthyroidism is a reversible cause of atrial fibrillation. Ruling it out confirms that Maria's AFib requires ongoing management rather than treating an underlying endocrine disorder.

---

## 3.6 Chapter 3 Mindmap: Diagnostic Workup Workflow

<a id="figure-61-cds-workflow"></a>

![Diagnostic Workup Flow](../assets/infographics/08_diagnostic_workup_flow.svg)

*Figure 3.1: Diagnostic Workup Flow — From chief complaint through vital signs, EKG, lab tests, imaging, clinical assessment, and OMOP CDM mapping*

**Lab Results Visualization:**

<a id="figure-62-risk-calculation"></a>

![Lab Results Query](../assets/infographics/09_lab_results_query.svg)

*Figure 3.2: Laboratory Results Query — OMOP CDM MEASUREMENT table query results with LOINC codes, reference ranges, and clinical interpretation*

---

## 3.7 Chapter Summary: Key Takeaways

### Clinical Practice Insights

1. **Order sets improve consistency:** Pre-built order sets ensure all necessary tests are ordered for a new AFib diagnosis, reducing the chance of missing important workup components.

2. **Lab results guide therapy:** Normal TSH rules out hyperthyroidism as a reversible AFib cause. Normal renal function confirms appropriate Apixaban dosing.

3. **Unexpected findings are common:** Maria's lipid panel reveals elevated LDL, an additional cardiovascular risk factor that may need treatment.

### Technical Implementation Insights

1. **HL7 messaging enables interoperability:** ORM^O01 (orders) and ORU^R01 (results) messages flow between EHR, lab systems, and imaging systems.

2. **LOINC provides universal test identification:** Whether a CBC is ordered from Quest, LabCorp, or an in-house lab, LOINC code 58410-2 uniquely identifies the test.

3. **Results interpretation is coded:** The "H" flag for high values is a standard HL7 interpretation code that triggers display highlighting in the EHR.

---

## 3.8 Interesting Facts

<div style="background-color: #d4edda; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **LOINC's Origin Story:** LOINC (Logical Observation Identifiers Names and Codes) was created by the **Regenstrief Institute** in 1994 when researchers discovered that identical lab tests at different hospitals were coded differently, making data aggregation nearly impossible. Today, LOINC contains over **100,000 codes** for tests and observations.

2. **The $100,000 Lab Order:** A 2019 study found that physicians ordering lab tests often don't know their costs. When cost information was displayed at order entry, unnecessary test ordering decreased by **9.1%**, saving millions annually.

3. **Critical Values Save Lives:** The concept of "critical values" (results requiring immediate notification) was introduced in 1972 by **Dr. George Lundberg**. Studies show that timely notification of critical values reduces adverse events by up to **50%**.

4. **Why ORU^R01?** The HL7 message type "ORU" stands for "Observation Result Unsolicited"—meaning the lab system sends results without being asked, unlike request-response patterns. The "R01" indicates it's the standard results message format.

5. **Point-of-Care Testing Accuracy:** Finger-stick glucose meters in clinics have a **15% margin of error** compared to laboratory glucose testing. That's why Maria's POC glucose of 218 mg/dL is confirmed with a lab draw showing 162 mg/dL (fasting vs. random difference).

6. **HbA1c Time Machine:** Hemoglobin A1c reflects average blood glucose over **2-3 months** because red blood cells live approximately 120 days. Maria's 8.2% HbA1c corresponds to an average glucose of approximately 189 mg/dL.

7. **The First Lab Test:** The first clinical laboratory test is believed to be **urine inspection** performed by ancient Egyptian physicians around 1500 BCE, documented in the Ebers Papyrus.

</div>

---

## 3.9 References & Sources

### Clinical Guidelines

1. **American Diabetes Association.** (2024). Standards of Medical Care in Diabetes—2024. *Diabetes Care*, 47(Supplement 1), S1-S321. https://doi.org/10.2337/dc24-Sint

2. **Stone NJ, et al.** (2022). 2021 ACC/AHA Guideline for the Evaluation and Management of Chronic Kidney Disease: A Report of the ACC/AHA Joint Committee on Clinical Practice Guidelines. *Circulation*, 145(10), e619-e696.

### Technical Standards

3. **Regenstrief Institute.** (2024). *LOINC User Guide Version 2.76*. https://loinc.org/kb/users-guide/

4. **HL7 International.** (2024). *HL7 v2.5.1: ORM^O01 General Order Message*. https://www.hl7.org/documentcenter/public/standards/V2/HL7_V2.5.1_Messaging_Standard.pdf

5. **HL7 International.** (2024). *HL7 v2.5.1: ORU^R01 Unsolicited Observation Message*. https://www.hl7.org/implement/standards/product_brief.cfm?product_id=144

6. **OHDSI.** (2024). *OMOP CDM v5.4: MEASUREMENT Table Specification*. https://ohdsi.github.io/CommonDataModel/cdm54.html#MEASUREMENT

### Laboratory Medicine

7. **Lundberg GD.** (1972). When to panic over abnormal values. *Medical Laboratory Observer*, 4, 47-54.

8. **McDonald CJ, et al.** (1997). LOINC, a Universal Standard for Identifying Laboratory Observations: A 5-Year Update. *Clinical Chemistry*, 43(6), 1036-1041.

9. **Nathan DM, et al.** (2008). Translating the A1C Assay Into Estimated Average Glucose Values. *Diabetes Care*, 31(8), 1473-1478.

### Cost & Quality

10. **Sedrak MS, et al.** (2019). Effect of a Price Transparency Intervention in the Electronic Health Record on Clinician Ordering of Habitual Laboratory Tests: The PRICE Randomized Clinical Trial. *JAMA Internal Medicine*, 179(1), 30-37.

11. **Clinical Laboratory Improvement Amendments (CLIA).** (1988). 42 CFR Part 493 - Laboratory Requirements.

---

<div style="page-break-after: always;"></div>

---

# Part III: Care Coordination

# Chapter 4: Specialty Referral & Care Coordination

## 4.1 Clinical Narrative

### Thursday, January 16, 2026 — 9:30 AM

Lisa Brown, the care coordinator, reviewed the morning's referral queue on her workstation. Maria Rodriguez's cardiology referral sat at the top, flagged as urgent.

"Dr. Torres's office has an opening for a new patient tomorrow afternoon," Lisa muttered to herself, picking up the phone.

She dialed Springfield Cardiology Associates.

"Hi, this is Lisa Brown, care coordinator at Community Health Clinic. I'm calling about an urgent referral for one of our patients to see Dr. Torres. She's a 46-year-old woman with new-onset atrial fibrillation, already started on rate control and anticoagulation by her PCP."

The cardiology scheduler, Angela, pulled up her system. "We can see her tomorrow at 2:30 PM if that works. I'll need her insurance information and the referral documentation."

"She's on Illinois Medicaid through Meridian. Let me send over the referral packet now."

---

### The Referral Documentation Package

<a id="table-41-referral-elements"></a>

**Table 4.1: Referral Documentation Elements**


Lisa assembled the referral packet in the EHR's Health Information Exchange (HIE) module. The packet included:

1. **Referral Order** (ServiceRequest)
2. **Clinical Summary** (Continuity of Care Document)
3. **Recent Visit Notes** (Progress note from 01/13/2026)
4. **EKG Report** (12-lead with interpretation)
5. **Lab Results** (CBC, CMP, TSH, Lipids)
6. **Current Medications** (MedicationStatement list)
7. **Problem List** (Active conditions)
8. **Insurance Verification** (Coverage status)

**FHIR ServiceRequest for Cardiology Referral:**

```json
{
  "resourceType": "ServiceRequest",
  "id": "referral-cardiology-maria",
  "status": "active",
  "intent": "order",
  "category": [{
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "3457005",
      "display": "Patient referral"
    }]
  }],
  "priority": "urgent",
  "code": {
    "coding": [{
      "system": "http://snomed.info/sct",
      "code": "183519002",
      "display": "Referral to cardiology service"
    }]
  },
  "subject": {
    "reference": "Patient/maria-rodriguez-12345",
    "display": "Maria Rodriguez"
  },
  "encounter": {
    "reference": "Encounter/encounter-20260113-maria"
  },
  "authoredOn": "2026-01-13T12:55:00-06:00",
  "requester": {
    "reference": "Practitioner/dr-sarah-chen",
    "display": "Dr. Sarah Chen, MD"
  },
  "performer": [{
    "reference": "Practitioner/dr-michael-torres",
    "display": "Dr. Michael Torres, MD, FACC"
  }],
  "reasonCode": [{
    "coding": [{
      "system": "http://hl7.org/fhir/sid/icd-10-cm",
      "code": "I48.91",
      "display": "Unspecified atrial fibrillation"
    }]
  }],
  "reasonReference": [{
    "reference": "Condition/afib-maria-20260113"
  }],
  "supportingInfo": [
    {"reference": "DiagnosticReport/ekg-maria-20260113"},
    {"reference": "DiagnosticReport/cmp-maria-20260114"},
    {"reference": "DiagnosticReport/cbc-maria-20260114"}
  ],
  "note": [{
    "text": "New-onset AFib discovered on routine visit. CHA2DS2-VASc = 3. Started on Apixaban 5mg BID and Metoprolol Succinate 25mg daily. Requesting evaluation for rhythm vs rate control strategy and echocardiogram."
  }]
}
```

---

### The C-CDA Continuity of Care Document

The referral package included a C-CDA (Consolidated Clinical Document Architecture) document summarizing Maria's clinical information:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ClinicalDocument xmlns="urn:hl7-org:v3">
  <realmCode code="US"/>
  <typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040"/>
  <templateId root="2.16.840.1.113883.10.20.22.1.2"/>
  <id root="2.16.840.1.113883.19.5.99999.1" extension="CCD-Maria-20260116"/>
  <code code="34133-9" codeSystem="2.16.840.1.113883.6.1" displayName="Summarization of Episode Note"/>
  <title>Continuity of Care Document - Maria Rodriguez</title>
  <effectiveTime value="20260116"/>
  <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25"/>

  <recordTarget>
    <patientRole>
      <id root="2.16.840.1.113883.19.5" extension="12345"/>
      <addr use="HP">
        <streetAddressLine>123 Main Street</streetAddressLine>
        <city>Springfield</city>
        <state>IL</state>
        <postalCode>62701</postalCode>
      </addr>
      <telecom use="HP" value="tel:+1-217-555-1234"/>
      <patient>
        <name use="L">
          <given>Maria</given>
          <family>Rodriguez</family>
        </name>
        <administrativeGenderCode code="F" codeSystem="2.16.840.1.113883.5.1"/>
        <birthTime value="19790315"/>
      </patient>
    </patientRole>
  </recordTarget>

  <!-- Problems Section -->
  <component>
    <section>
      <templateId root="2.16.840.1.113883.10.20.22.2.5.1"/>
      <code code="11450-4" codeSystem="2.16.840.1.113883.6.1" displayName="Problem List"/>
      <title>Problems</title>
      <text>
        <list>
          <item>Atrial fibrillation (I48.91) - Active - Onset 01/2026</item>
          <item>Type 2 Diabetes Mellitus (E11.9) - Active - Onset 2023</item>
          <item>Essential Hypertension (I10) - Active - Onset 2021</item>
          <item>Obesity (E66.9) - Active</item>
        </list>
      </text>
      <entry>
        <act classCode="ACT" moodCode="EVN">
          <entryRelationship typeCode="SUBJ">
            <observation classCode="OBS" moodCode="EVN">
              <code code="55607006" codeSystem="2.16.840.1.113883.6.96" displayName="Problem"/>
              <value xsi:type="CD" code="49436004" codeSystem="2.16.840.1.113883.6.96" displayName="Atrial fibrillation"/>
            </observation>
          </entryRelationship>
        </act>
      </entry>
    </section>
  </component>

  <!-- Medications Section -->
  <component>
    <section>
      <templateId root="2.16.840.1.113883.10.20.22.2.1.1"/>
      <code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="Medications"/>
      <title>Medications</title>
      <text>
        <list>
          <item>Apixaban 5mg tablet - 1 tablet by mouth twice daily</item>
          <item>Metoprolol Succinate ER 25mg - 1 tablet by mouth daily</item>
          <item>Metformin 1000mg - 1 tablet by mouth twice daily</item>
          <item>Lisinopril 20mg - 1 tablet by mouth daily</item>
        </list>
      </text>
    </section>
  </component>
</ClinicalDocument>
```

---

### Friday, January 17, 2026 — 2:30 PM: The Cardiology Consultation

Maria arrived at Springfield Cardiology Associates for her appointment with Dr. Michael Torres. The intake nurse obtained vitals:

- **BP:** 142/88 mmHg
- **HR:** 92 bpm, irregular
- **SpO2:** 98% RA

Dr. Torres reviewed the referral documentation before entering the exam room. He noted Dr. Chen's workup was thorough—the key pending item was the echocardiogram, which his office could perform today.

"Mrs. Rodriguez, I'm Dr. Torres. Dr. Chen referred you for your new atrial fibrillation. Tell me how you've been feeling since starting the new medications."

Maria described her experience over the past four days: the palpitations had decreased in frequency and intensity since starting the Metoprolol, though she still noticed occasional irregular beats. No dizziness, no chest pain, no bleeding complications from the Apixaban.

---

### Echocardiogram Findings

After the clinical evaluation, Dr. Torres ordered a transthoracic echocardiogram (TTE) performed in the office:

```
TRANSTHORACIC ECHOCARDIOGRAM REPORT
Date: 01/17/2026
Patient: Rodriguez, Maria (MRN: 12345)
Referring Physician: Sarah Chen, MD
Performing Physician: Michael Torres, MD, FACC

INDICATIONS: New-onset atrial fibrillation

TECHNICAL QUALITY: Good

FINDINGS:

Left Ventricle:
- LV size: Normal (LVIDD 4.6 cm)
- LV wall thickness: Normal (IVS 0.9 cm, PW 0.9 cm)
- LV ejection fraction: 55-60% (Normal)
- No regional wall motion abnormalities
- Grade I diastolic dysfunction (impaired relaxation)

Left Atrium:
- LA size: Mildly dilated (4.2 cm anteroposterior)
- LA volume index: 32 mL/m² (mildly increased, normal <28)

Right Ventricle:
- RV size: Normal
- RV systolic function: Normal (TAPSE 2.2 cm)

Right Atrium:
- RA size: Normal

Valves:
- Mitral valve: Structurally normal, trace regurgitation
- Aortic valve: Trileaflet, normal opening, no stenosis, trace regurgitation
- Tricuspid valve: Normal, mild regurgitation (estimated RVSP 28 mmHg)
- Pulmonic valve: Normal

Pericardium: No effusion

Aorta: Aortic root normal (3.2 cm)

IMPRESSION:
1. Normal left ventricular size and systolic function (EF 55-60%)
2. Mildly dilated left atrium (suggests some chronicity of AFib)
3. Grade I diastolic dysfunction
4. No significant valvular disease
5. No evidence of structural heart disease to explain atrial fibrillation

ICD-10 Codes:
- I48.91 Atrial fibrillation, unspecified
- R94.31 Abnormal electrocardiogram

CPT Code: 93306 (TTE with Doppler and color flow)

Electronically signed: Michael Torres, MD, FACC
01/17/2026 3:45 PM
```

---

### The Cardiology Consultation Note

```
CARDIOLOGY CONSULTATION

Date: 01/17/2026
Referring Physician: Sarah Chen, MD, Family Medicine
Consultant: Michael Torres, MD, FACC

REASON FOR CONSULTATION:
New-onset atrial fibrillation

HISTORY OF PRESENT ILLNESS:
46-year-old female with history of type 2 diabetes mellitus,
hypertension, and obesity referred for evaluation of new-onset
atrial fibrillation discovered during routine office visit on
01/13/2026. Patient presented with 2-week history of fatigue and
1-week history of palpitations described as heart "fluttering."

EKG on 01/13 confirmed atrial fibrillation with RVR, rate 98 bpm.
Dr. Chen initiated rate control with Metoprolol Succinate ER 25mg
daily and anticoagulation with Apixaban 5mg BID based on CHA2DS2-VASc
score of 3.

Since starting medications, patient reports significant improvement
in palpitations. She denies chest pain, syncope, dyspnea, orthopnea,
PND, or peripheral edema. No bleeding complications from anticoagulation.

PAST MEDICAL HISTORY:
1. Atrial fibrillation - new diagnosis 01/2026
2. Type 2 Diabetes Mellitus - diagnosed 2023
3. Essential Hypertension - diagnosed 2021
4. Obesity (BMI 32.1)

MEDICATIONS:
1. Apixaban 5mg BID (started 01/13/2026)
2. Metoprolol Succinate ER 25mg daily (started 01/13/2026)
3. Metformin 1000mg BID
4. Lisinopril 20mg daily

ALLERGIES: No known drug allergies

SOCIAL HISTORY:
Elementary school teacher. Non-smoker. Occasional alcohol (1-2 drinks/week).

FAMILY HISTORY:
Mother: Type 2 diabetes, hypertension
Father: Myocardial infarction at age 62

REVIEW OF SYSTEMS:
Constitutional: (+) Fatigue (improving), (-) fever, (-) weight change
Cardiovascular: (+) Palpitations (improved), (-) chest pain, (-) dyspnea,
  (-) orthopnea, (-) PND, (-) edema, (-) syncope
Respiratory: (-) Cough, (-) dyspnea, (-) wheezing
GI: (-) Nausea, (-) vomiting, (-) abdominal pain, (-) melena, (-) hematochezia
GU: (-) Hematuria
Neurological: (-) TIA symptoms, (-) focal weakness

PHYSICAL EXAMINATION:
Vitals: BP 142/88, HR 92 irregular, RR 16, SpO2 98% RA
General: Alert, comfortable, no acute distress
HEENT: NCAT, PERRL
Neck: JVP not elevated (~7 cm), no carotid bruits
Cardiovascular: Irregularly irregular rhythm, rate ~90, no murmurs, no gallop
Lungs: Clear to auscultation bilaterally
Abdomen: Soft, non-tender, no hepatomegaly
Extremities: No edema, warm, well-perfused
Neurological: Alert, oriented, no focal deficits

DIAGNOSTIC DATA:
EKG (01/13/2026): Atrial fibrillation with RVR, rate 98, no ischemic changes

Labs (01/14/2026):
- TSH 1.8 (normal) - rules out thyroid disease
- CBC: Normal, platelets adequate (245K)
- CMP: Cr 0.9, eGFR 82, K 4.2 - normal renal function
- Lipid panel: TC 218, LDL 139 - elevated

Echocardiogram (today, 01/17/2026):
- EF 55-60% (normal)
- LA mildly dilated (4.2 cm) - suggests some chronicity
- No significant valvular disease
- Grade I diastolic dysfunction

RISK STRATIFICATION:
CHA2DS2-VASc Score: 3 (HTN +1, DM +1, Female +1)
- Annual stroke risk: 3.2%
- Anticoagulation strongly recommended

HAS-BLED Score: 1 (HTN +1)
- Low bleeding risk
- Favorable benefit-risk for anticoagulation

ASSESSMENT AND PLAN:

1. ATRIAL FIBRILLATION - New-onset, likely paroxysmal

   The patient presents with new-onset AF with preserved LV function.
   Mildly dilated LA on echo suggests some chronicity despite recent
   symptom onset. No reversible cause identified (TSH normal, no
   structural heart disease).

   a) Anticoagulation - CONTINUE
      - Apixaban 5mg BID is appropriate (CHA2DS2-VASc 3, HAS-BLED 1)
      - No dose adjustment needed (age <80, weight >60kg, eGFR >25)
      - Counseled on bleeding precautions, importance of adherence

   b) Rate Control - CONTINUE, consider uptitration
      - Current Metoprolol Succinate ER 25mg daily
      - Resting HR today ~92 (goal 60-80 at rest)
      - INCREASE to 50mg daily for better rate control
      - Monitor for bradycardia, fatigue

   c) Rhythm Control Consideration:
      - Patient is a potential candidate for rhythm control given:
        * Young age (46)
        * Symptomatic (fatigue, palpitations)
        * Preserved LV function
        * No significant structural heart disease
      - Options discussed:
        * Antiarrhythmic drugs (flecainide, propafenone, sotalol, amiodarone)
        * Catheter ablation
      - Patient preference: Trial of rate control first
      - Will reassess at 4-week follow-up
      - If symptomatic despite rate control, will proceed with rhythm control

   d) Lifestyle Modifications:
      - Weight loss (5-10% of body weight improves AF burden)
      - Limit alcohol and caffeine
      - Sleep apnea screening (will order home sleep study)
      - Blood pressure optimization

2. CARDIOVASCULAR RISK FACTORS

   a) Dyslipidemia:
      - LDL 139 mg/dL (elevated)
      - In setting of diabetes and now AFib, recommend statin therapy
      - Discussed with primary care
      - Recommend: Atorvastatin 40mg daily (moderate-intensity statin)

   b) Diabetes - suboptimally controlled per PCP
      - Important modifiable risk factor for AFib
      - Refer back to PCP for optimization

   c) Hypertension - not at goal
      - BP 142/88 today
      - Rate control with metoprolol will help
      - Goal BP <130/80

3. FOLLOW-UP
   - Cardiology: 4 weeks (02/14/2026) - assess rate control, symptoms
   - EKG at follow-up visit
   - If symptomatic AFib recurs, will discuss rhythm control options
   - Patient given instructions for when to call or seek emergency care

BILLING:
New patient consultation, high complexity (99205)
Echocardiogram, TTE complete (93306)

Electronically signed: Michael Torres, MD, FACC
01/17/2026 4:30 PM

CC: Sarah Chen, MD (via HIE)
```

---

<a id="figure-41-referral-flow"></a>

<a id="table-42-care-coordination"></a>

## 4.2 Care Coordination Documentation

### FHIR CarePlan for Atrial Fibrillation Management

```json
{
  "resourceType": "CarePlan",
  "id": "careplan-afib-maria",
  "status": "active",
  "intent": "plan",
  "title": "Atrial Fibrillation Management Plan",
  "description": "Comprehensive care plan for new-onset AFib including anticoagulation, rate control, and cardiovascular risk reduction",
  "subject": {
    "reference": "Patient/maria-rodriguez-12345",
    "display": "Maria Rodriguez"
  },
  "period": {
    "start": "2026-01-13"
  },
  "author": {
    "reference": "Practitioner/dr-sarah-chen",
    "display": "Dr. Sarah Chen, MD"
  },
  "contributor": [{
    "reference": "Practitioner/dr-michael-torres",
    "display": "Dr. Michael Torres, MD, FACC"
  }],
  "addresses": [{
    "reference": "Condition/afib-maria-20260113",
    "display": "Atrial fibrillation"
  }],
  "goal": [
    {
      "reference": "Goal/afib-rate-control",
      "display": "Heart rate 60-80 bpm at rest"
    },
    {
      "reference": "Goal/stroke-prevention",
      "display": "Prevent thromboembolic stroke"
    },
    {
      "reference": "Goal/symptom-control",
      "display": "Reduce palpitation frequency"
    }
  ],
  "activity": [
    {
      "detail": {
        "kind": "MedicationRequest",
        "code": {
          "coding": [{
            "system": "http://snomed.info/sct",
            "code": "432867008",
            "display": "Anticoagulant therapy"
          }]
        },
        "status": "in-progress",
        "scheduledString": "Apixaban 5mg twice daily, ongoing",
        "performer": [{
          "reference": "Patient/maria-rodriguez-12345"
        }],
        "description": "Apixaban for stroke prevention in atrial fibrillation"
      }
    },
    {
      "detail": {
        "kind": "MedicationRequest",
        "code": {
          "coding": [{
            "system": "http://snomed.info/sct",
            "code": "413843005",
            "display": "Rate control medication"
          }]
        },
        "status": "in-progress",
        "scheduledString": "Metoprolol Succinate 50mg daily",
        "description": "Beta-blocker for rate control"
      }
    },
    {
      "detail": {
        "kind": "Appointment",
        "code": {
          "coding": [{
            "system": "http://snomed.info/sct",
            "code": "183519002",
            "display": "Cardiology follow-up"
          }]
        },
        "status": "scheduled",
        "scheduledPeriod": {
          "start": "2026-02-14T14:30:00-06:00"
        },
        "performer": [{
          "reference": "Practitioner/dr-michael-torres"
        }],
        "description": "4-week cardiology follow-up for rate control assessment"
      }
    },
    {
      "detail": {
        "kind": "ServiceRequest",
        "status": "scheduled",
        "description": "Home sleep study to screen for obstructive sleep apnea"
      }
    }
  ],
  "note": [{
    "time": "2026-01-17T16:30:00-06:00",
    "authorReference": {
      "reference": "Practitioner/dr-michael-torres"
    },
    "text": "Patient prefers rate control strategy initially. Will reassess rhythm control options at 4-week follow-up if symptoms persist."
  }]
}
```

---

## 4.3 Provider Perspective

> "Coordinating specialty referrals is one of the most complex parts of my job. I need to ensure the specialist has everything they need, the patient understands where to go and what to expect, insurance authorizes the visit if needed, and the loop gets closed when the consultation is complete. When any piece breaks down, patients fall through the cracks.
>
> For Maria, I tracked that referral from submission to completion. I confirmed the appointment was scheduled, verified the consultation note came back to us, and made sure Dr. Chen reviewed Dr. Torres's recommendations. That feedback loop is critical—too often, patients see specialists and their PCP never learns what happened.
>
> The FHIR CarePlan helps us coordinate. It shows everyone on the care team what the goals are, what actions are planned, and who's responsible for each piece. When Maria comes back for her 2-week follow-up with Dr. Chen, we can see that her Metoprolol was increased at the cardiology visit and that a sleep study is pending."
>
> — Lisa Brown, RN, Care Coordinator

---

## 4.4 Chapter 4 Mindmap: Care Coordination

The visit history timeline below illustrates Maria's complete care journey, including all provider encounters and care coordination touchpoints:

<a id="figure-71-quality-calc"></a>

![Visit History Timeline](../assets/infographics/11_visit_history_timeline.svg)

*Figure 4.1: Visit History Timeline — Maria's complete care journey from January through February 2026, showing all provider encounters, care sites, procedures, and revenue analysis*

**Provider Panel and Care Team:**

<a id="figure-72-pop-health"></a>

![Provider Panel](../assets/infographics/14_provider_panel.svg)

*Figure 4.2: Provider Panel & Care Team — Interdisciplinary team including PCP, cardiologist, nurse, and pharmacist with OMOP CDM relationships and billing roles*

---

## 4.5 Chapter 4 Summary

### Key Takeaways

**Clinical Practice Insights:**

1. **Care coordination prevents fragmentation:** Lisa's proactive referral management ensured Maria's cardiology appointment was scheduled within 48 hours of her AFib diagnosis.

2. **Complete information transfer is critical:** The C-CDA document transmitted Maria's medications, allergies, and recent labs, preventing the cardiologist from duplicating tests.

3. **Referral loop closure matters:** Without active tracking, up to 50% of referrals never result in completed consultations. Lisa's follow-up ensured Maria actually saw the specialist.

**Technical Implementation Insights:**

1. **FHIR ServiceRequest:** The standardized referral format enables any receiving system to understand the clinical request, priority, and supporting documentation.

2. **C-CDA for clinical summaries:** Consolidated Clinical Document Architecture provides a structured, computable summary that both humans and systems can interpret.

3. **Prior authorization tracking:** Integration with payer systems prevents delays from authorization requirements, especially critical for urgent referrals.

---

## 4.6 Interesting Facts

<div style="background-color: #f8d7da; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **The Lost Referral Problem:** Studies show that **25-50% of referring physicians** don't receive consultation reports, and nearly **30% of specialists** don't receive complete information about why the patient was referred.

2. **Fax Machines Persist:** Despite billions invested in health IT, approximately **75% of medical information** was still exchanged via fax as recently as 2019. The fax persists because it's universally available and legally recognized.

3. **C-CDA's Name:** The "Consolidated" in Consolidated Clinical Document Architecture refers to the 2011 effort to combine nine different CDA implementation guides into a single standard, simplifying interoperability.

4. **Prior Auth Burden:** A 2022 AMA survey found that physicians complete an average of **41 prior authorization requests per week**, consuming nearly two full business days of staff time.

5. **The 14-Day Rule:** CMS regulations require that Medicare Advantage plans complete prior authorization decisions within **14 calendar days** for standard requests and **72 hours** for urgent requests.

6. **Why "Referral"?:** The term comes from the Latin "referre" meaning "to carry back." Originally, a referral was a letter physically carried by the patient to the specialist.

</div>

---

## 4.7 References & Sources

### Clinical Guidelines

1. **O'Malley AS, Reschovsky JD.** (2011). Referral and Consultation Communication Between Primary Care and Specialist Physicians: Finding Common Ground. *Archives of Internal Medicine*, 171(1), 56-65.

2. **Mehrotra A, et al.** (2011). Drop-off Rates in Referrals. *Health Affairs*, 30(6), 1146-1154.

### Technical Standards

3. **HL7 International.** (2024). *C-CDA R2.1 Implementation Guide*. http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492

4. **HL7 International.** (2024). *FHIR R4 ServiceRequest Resource*. http://hl7.org/fhir/R4/servicerequest.html

5. **ONC.** (2023). *Interoperability Standards Advisory: Care Coordination*. https://www.healthit.gov/isa/

### Healthcare Operations

6. **American Medical Association.** (2022). *2022 AMA Prior Authorization (PA) Physician Survey*. https://www.ama-assn.org/practice-management/prior-authorization

7. **CMS.** (2024). *Medicare Managed Care Manual: Chapter 13 - Prior Authorization*. https://www.cms.gov/regulations-and-guidance/guidance/manuals/downloads/mc86c13.pdf

---

<div style="page-break-after: always;"></div>

---

# Chapter 5: Medication Management & Pharmacovigilance

<a id="table-51-medications-rxnorm"></a>

## 5.1 Clinical Narrative

### Friday, January 17, 2026 — 5:15 PM

Maria stopped at her pharmacy, Walgreens on Jefferson Street, after her cardiology appointment. Dr. Torres had sent the updated Metoprolol prescription electronically, and she needed to pick up her medications.

Jessica Martinez, PharmD, BCPS—the clinical pharmacist on duty—reviewed the incoming e-prescriptions:

1. **New Prescription:** Metoprolol Succinate ER 50mg, #30, 1 tablet PO daily (increased from 25mg)
2. **Continue:** Apixaban 5mg, #60, 1 tablet PO BID
3. **Continue:** Metformin 1000mg, #60, 1 tablet PO BID
4. **Continue:** Lisinopril 20mg, #30, 1 tablet PO daily

Jessica pulled up Maria's profile in the pharmacy system. The drug interaction checker flagged:

```
DRUG INTERACTION ALERT
Severity: MODERATE

Interaction: Metoprolol + Metformin
Description: Beta-blockers may mask tachycardia symptoms of hypoglycemia
Clinical Significance: Monitor blood glucose more frequently. Counsel
  patient on alternative hypoglycemia symptoms (sweating, tremor, hunger).
Recommendation: Counsel patient; no dose adjustment needed.
Action Required: Pharmacist review and counseling
```

Jessica dispensed the medications and called Maria to the counseling window.

"Mrs. Rodriguez, I see you're starting a higher dose of your heart medication. Let me go over a few important things."

She explained:
- **Apixaban:** Continue twice daily at the same times each day. If a dose is missed and it's been less than 6 hours, take it; if more than 6 hours, skip it and take the next dose as scheduled. Never double up. Watch for signs of bleeding (unusual bruising, blood in stool or urine, prolonged bleeding from cuts).
- **Metoprolol (increased dose):** Take in the morning. May cause fatigue or dizziness initially. Don't stop abruptly—must be tapered. Check heart rate periodically.
- **Metformin interaction:** Beta-blockers can mask some symptoms of low blood sugar. Pay attention to sweating, tremor, and hunger as alternative warning signs.

---

### The Medication Profile

**FHIR MedicationStatement Resources:**

Maria's current medication profile consists of four active medications:

```json
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "resource": {
        "resourceType": "MedicationStatement",
        "id": "medstmt-apixaban-maria",
        "status": "active",
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "1364435",
              "display": "Apixaban 5 MG Oral Tablet"
            }
          ]
        },
        "subject": {
          "reference": "Patient/maria-rodriguez-12345"
        },
        "effectivePeriod": {
          "start": "2026-01-13"
        },
        "dateAsserted": "2026-01-13",
        "informationSource": {
          "reference": "Practitioner/dr-sarah-chen"
        },
        "reasonCode": [{
          "coding": [{
            "system": "http://snomed.info/sct",
            "code": "49436004",
            "display": "Atrial fibrillation"
          }]
        }],
        "dosage": [{
          "text": "5 mg by mouth twice daily",
          "timing": {
            "repeat": {
              "frequency": 2,
              "period": 1,
              "periodUnit": "d"
            }
          },
          "route": {
            "coding": [{
              "system": "http://snomed.info/sct",
              "code": "26643006",
              "display": "Oral route"
            }]
          },
          "doseAndRate": [{
            "doseQuantity": {
              "value": 5,
              "unit": "mg",
              "system": "http://unitsofmeasure.org",
              "code": "mg"
            }
          }]
        }]
      }
    },
    {
      "resource": {
        "resourceType": "MedicationStatement",
        "id": "medstmt-metoprolol-maria",
        "status": "active",
        "medicationCodeableConcept": {
          "coding": [{
            "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
            "code": "866926",
            "display": "Metoprolol Succinate 50 MG Extended Release Oral Tablet"
          }]
        },
        "subject": {
          "reference": "Patient/maria-rodriguez-12345"
        },
        "effectivePeriod": {
          "start": "2026-01-17"
        },
        "dosage": [{
          "text": "50 mg by mouth once daily",
          "timing": {
            "repeat": {
              "frequency": 1,
              "period": 1,
              "periodUnit": "d"
            }
          },
          "doseAndRate": [{
            "doseQuantity": {
              "value": 50,
              "unit": "mg"
            }
          }]
        }]
      }
    }
  ]
}
```

---

## 5.2 RxNorm Hierarchy

### Understanding RxNorm Term Types

RxNorm provides a normalized naming system for medications. Let's examine the hierarchy for Apixaban:

<a id="figure-51-rxnorm-hierarchy"></a>

![RxNorm Medication Hierarchy](../assets/infographics/17_rxnorm_hierarchy.svg)

*Figure 5.2: RxNorm Medication Hierarchy — Apixaban from ingredient (IN) through clinical drug (SCD) to branded drug (SBD), showing Maria's prescription (5 MG tablet)*

**Term Type Definitions:**
| Type | Description | Example |
|------|-------------|---------|
| IN | Ingredient | Apixaban |
| SCDC | Semantic Clinical Drug Component | Apixaban 5 MG |
| SCD | Semantic Clinical Drug | Apixaban 5 MG Oral Tablet |
| SBD | Semantic Branded Drug | Eliquis 5 MG Oral Tablet |
| BPCK | Brand Name Pack | 60 Eliquis 5 MG Tablet Pack |

---

## 5.3 OMOP Drug Exposure

<a id="table-53-omop-drug-exposure"></a>

**Table 5.3: OMOP Drug Exposure Fields**


```sql
-- Insert Maria's current medications into OMOP drug_exposure table
INSERT INTO drug_exposure (
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
-- Apixaban
(5001, 12345, 40228152, '2026-01-13', '2026-01-13 13:00:00',
 '2026-02-12', NULL, NULL, 32838, NULL, 5, 60, 30,
 '5 mg by mouth twice daily', 4132161, NULL,
 101, 1001, NULL, '1364435', 40228152, 'Oral', 'mg'),
-- Metoprolol Succinate 50mg (increased from 25mg)
(5002, 12345, 40165015, '2026-01-17', '2026-01-17 17:30:00',
 '2026-02-16', NULL, NULL, 32838, NULL, 5, 30, 30,
 '50 mg by mouth once daily', 4132161, NULL,
 103, 1002, NULL, '866926', 40165015, 'Oral', 'mg'),
-- Metformin (increased dose)
(5003, 12345, 40164929, '2026-01-13', '2026-01-13 13:00:00',
 '2026-02-12', NULL, NULL, 32838, NULL, 5, 60, 30,
 '1000 mg by mouth twice daily', 4132161, NULL,
 101, 1001, NULL, '861007', 40164929, 'Oral', 'mg'),
-- Lisinopril
(5004, 12345, 40163999, '2021-03-15', '2021-03-15 10:00:00',
 NULL, NULL, NULL, 32838, NULL, 11, 30, 30,
 '20 mg by mouth once daily', 4132161, NULL,
 101, NULL, NULL, '314076', 40163999, 'Oral', 'mg');
```

**Live Query Results: Maria's Active Medications from OMOP CDM**

```sql
-- Query: Active Medications with RxNorm Codes
SELECT
    de.drug_exposure_start_date AS start_date,
    c.concept_name AS medication,
    de.quantity,
    de.days_supply,
    de.sig AS instructions,
    de.drug_source_value AS rxnorm_code
FROM cdm.drug_exposure de
JOIN vocabulary.concept c ON de.drug_concept_id = c.concept_id
WHERE de.person_id = 12345
ORDER BY de.drug_exposure_start_date;
```

<div align="center">

| Start Date | Medication | Qty | Days Supply | Instructions | RxNorm |
|:----------:|:-----------|----:|:-----------:|:-------------|:------:|
| 2021-03-10 | lisinopril | 30 | 30 | Take 20 mg by mouth once daily | 314076 |
| 2023-01-15 | metformin | 60 | 30 | Take 1000 mg by mouth twice daily with meals | 861007 |
| 2026-01-13 | Apixaban 5 MG Oral Tablet | 60 | 30 | Take 5 mg by mouth twice daily | 1364435 |
| 2026-01-13 | Metoprolol Succinate ER 25 MG | 30 | 30 | Take 25 mg by mouth once daily | 866924 |

*Query returned 4 rows*

</div>

**Understanding the Medication Timeline:**

| Medication | Start Date | Indication | RxNorm Hierarchy Level |
|------------|------------|------------|----------------------|
| **Lisinopril 20mg** | 2021-03-10 | Hypertension | SCD (Clinical Drug) |
| **Metformin 1000mg** | 2023-01-15 | Type 2 Diabetes | IN (Ingredient level) |
| **Apixaban 5mg** | 2026-01-13 | AFib stroke prevention | SCD (Clinical Drug) |
| **Metoprolol Succinate 25mg** | 2026-01-13 | AFib rate control | SCD (Clinical Drug) |

Note that the Metformin entry uses the ingredient-level RxNorm code (861007), while Apixaban uses the clinical drug level (1364435). Both are valid in OMOP, but the concept_ancestor table allows researchers to query at any level of the hierarchy—for example, finding all patients on "any anticoagulant" by querying descendants of the anticoagulant drug class concept.

---

<a id="table-52-drug-interactions"></a>

## 5.4 Pharmacovigilance Monitoring

### Monitoring Parameters for Apixaban

Maria's anticoagulation therapy requires ongoing monitoring for safety and efficacy:

| Parameter | Monitoring | Frequency | Action Threshold |
|-----------|------------|-----------|------------------|
| Signs of bleeding | Patient report, physical exam | Each visit | Any significant bleeding → evaluate |
| Hemoglobin/Hematocrit | CBC | Every 3-6 months | Drop >2 g/dL → investigate |
| Renal function | Serum creatinine, eGFR | Every 6-12 months | CrCl <25 → dose adjustment or alternative |
| Hepatic function | LFTs | Annually | ALT >3x ULN → evaluate |
| Medication adherence | Patient report, refill history | Each visit | Missed doses → reinforce education |
| Drug interactions | Review at each visit | Ongoing | New interacting drugs → adjust therapy |

### FHIR DetectedIssue for Drug Interaction

```json
{
  "resourceType": "DetectedIssue",
  "id": "interaction-metoprolol-metformin",
  "status": "preliminary",
  "code": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
      "code": "DRG",
      "display": "Drug Interaction Alert"
    }]
  },
  "severity": "moderate",
  "patient": {
    "reference": "Patient/maria-rodriguez-12345"
  },
  "identifiedDateTime": "2026-01-17T17:15:00-06:00",
  "author": {
    "reference": "Device/pharmacy-system"
  },
  "implicated": [
    {
      "reference": "MedicationStatement/medstmt-metoprolol-maria",
      "display": "Metoprolol Succinate 50mg"
    },
    {
      "reference": "MedicationStatement/medstmt-metformin-maria",
      "display": "Metformin 1000mg"
    }
  ],
  "detail": "Beta-blockers may mask tachycardia symptoms of hypoglycemia. Counsel patient on alternative hypoglycemia symptoms.",
  "mitigation": [{
    "action": {
      "coding": [{
        "system": "http://snomed.info/sct",
        "code": "409073007",
        "display": "Patient education"
      }]
    },
    "date": "2026-01-17T17:30:00-06:00",
    "author": {
      "reference": "Practitioner/jessica-martinez-pharmd"
    }
  }]
}
```

---

## 5.5 Chapter 5 Mindmap: Medication Management

<a id="figure-52-med-safety"></a>

![Medication Management Workflow](../assets/infographics/07_medication_workflow.svg)

*Figure 5.1: Medication Management Workflow — From prescribing through e-prescribe transmission to pharmacy dispensing, showing Maria's complete medication profile with RxNorm codes and drug interaction monitoring*

---

## 5.6 Chapter 5 Summary

### Key Takeaways

**Clinical Practice Insights:**

1. **Pharmacist review prevents errors:** Jessica's drug interaction check identified the metoprolol-metformin interaction that could mask hypoglycemia symptoms—critical patient safety information.

2. **Medication reconciliation is continuous:** Maria's medication list evolved from 2 medications to 5 across her care journey. Each transition (PCP→ED→Cardiology→Pharmacy) required reconciliation.

3. **Patient education matters:** Understanding why a medication is prescribed, its side effects, and warning signs improves adherence and safety outcomes.

**Technical Implementation Insights:**

1. **RxNorm provides the vocabulary:** Every medication, from brand to generic to ingredient, maps to a unique RxNorm concept enabling consistent drug-drug interaction checking.

2. **NCPDP Script for e-prescribing:** The SCRIPT standard enables electronic prescription transmission from prescriber to pharmacy, reducing transcription errors.

3. **Drug interaction databases:** Commercial databases (First Databank, Medi-Span, Micromedex) power the interaction checking that caught the metformin-metoprolol concern.

---

## 5.7 Interesting Facts

<div style="background-color: #e2e3e5; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **Medication Errors Kill:** The Institute of Medicine estimates that **7,000-9,000 Americans die annually** from medication errors, and hundreds of thousands more experience adverse drug events.

2. **RxNorm's Complexity:** RxNorm contains over **100,000 unique drug concepts**, from specific products (Lipitor 10mg tablet) to ingredients (atorvastatin) to clinical drug components.

3. **The Warfarin vs. Apixaban Shift:** Direct oral anticoagulants like apixaban have largely replaced warfarin for AFib. In 2010, warfarin was used in >95% of AFib patients; by 2023, DOACs are used in >70%.

4. **Why "Succ ER"?:** Metoprolol Succinate ER (Extended Release) uses a different salt form than Metoprolol Tartrate. The succinate version allows once-daily dosing, while tartrate requires twice-daily dosing—clinically important for adherence.

5. **The NDC Mystery:** National Drug Codes (NDC) have a quirky format: the first segment identifies the labeler, the second identifies the product, and the third identifies the package size. The same drug from different manufacturers has different NDCs.

6. **Alert Fatigue is Real:** Studies show that clinicians override **90-96% of drug alerts** in EHR systems, a phenomenon called "alert fatigue" that can cause truly important warnings to be dismissed.

7. **First E-Prescribing:** Electronic prescribing began in the late 1990s, but widespread adoption didn't occur until CMS began requiring e-prescribing for Medicare Part D in 2008.

</div>

---

## 5.8 References & Sources

### Clinical Guidelines

1. **January CT, Wann LS, et al.** (2019). 2019 AHA/ACC/HRS Focused Update: Anticoagulation in Atrial Fibrillation. *Circulation*, 140(2), e125-e151.

2. **Lip GYH, et al.** (2016). Antithrombotic Therapy for Atrial Fibrillation: CHEST Guideline and Expert Panel Report. *Chest*, 149(6), 1377-1410.

### Technical Standards

3. **NLM.** (2024). *RxNorm Technical Documentation*. https://www.nlm.nih.gov/research/umls/rxnorm/docs/techdoc.html

4. **NCPDP.** (2024). *SCRIPT Standard Implementation Guide*. https://www.ncpdp.org/NCPDP/media/pdf/SCRIPT-Standard.pdf

5. **HL7 International.** (2024). *FHIR R4 MedicationRequest Resource*. http://hl7.org/fhir/R4/medicationrequest.html

6. **OHDSI.** (2024). *OMOP CDM v5.4: DRUG_EXPOSURE Table*. https://ohdsi.github.io/CommonDataModel/cdm54.html#DRUG_EXPOSURE

### Medication Safety

7. **Institute of Medicine.** (2007). *Preventing Medication Errors*. National Academies Press. https://doi.org/10.17226/11623

8. **van der Sijs H, et al.** (2006). Overriding of Drug Safety Alerts in Computerized Physician Order Entry. *Journal of the American Medical Informatics Association*, 13(2), 138-147.

9. **Nanji KC, et al.** (2014). Overrides of Medication-Related Clinical Decision Support Alerts in Outpatients. *Journal of the American Medical Informatics Association*, 21(3), 487-491.

---

<div style="page-break-after: always;"></div>

---

# Part IV: Clinical Intelligence

# Chapter 6: Clinical Decision Support & Risk Stratification

## 6.1 Clinical Narrative

### The CDS Engine in Action

Throughout Maria's journey, clinical decision support (CDS) systems have been quietly working in the background, helping clinicians make evidence-based decisions. Let's examine the CDS alerts that fired and their impact on care.

**CDS Alerts During Maria's Care:**

| Alert | Category | Severity | Action Taken |
|-------|----------|----------|--------------|
| AFib + CHA₂DS₂-VASc ≥2 | Stroke Prevention | Warning | Apixaban ordered |
| Elevated BP + Diabetes | HTN Treatment | Info | Acknowledged |
| Metformin + Beta-blocker | Drug Interaction | Moderate | Patient counseled |
| HbA1c >8% | Diabetes Quality Gap | Reminder | Metformin increased |
| Diabetic eye exam overdue | Preventive Care | Reminder | Ophthalmology referral |

---

### CDS Hooks Implementation

The CDS system uses the HL7 CDS Hooks standard to provide decision support at the point of care. Here's how the stroke risk alert was implemented:

**CDS Hooks Service Definition:**

```json
{
  "hook": "patient-view",
  "title": "Atrial Fibrillation Stroke Risk Assessment",
  "description": "Calculates CHA2DS2-VASc score and recommends anticoagulation for patients with atrial fibrillation",
  "id": "afib-stroke-risk-assessment",
  "prefetch": {
    "patient": "Patient/{{context.patientId}}",
    "conditions": "Condition?patient={{context.patientId}}&clinical-status=active",
    "medications": "MedicationRequest?patient={{context.patientId}}&status=active"
  }
}
```

**CDS Hooks Request (sent when Dr. Chen opened Maria's chart):**

```json
{
  "hook": "patient-view",
  "hookInstance": "d1577c69-dfbe-44ad-ba6d-3e05e953b2ea",
  "context": {
    "userId": "Practitioner/dr-sarah-chen",
    "patientId": "Patient/maria-rodriguez-12345"
  },
  "prefetch": {
    "patient": {
      "resourceType": "Patient",
      "id": "maria-rodriguez-12345",
      "birthDate": "1979-03-15",
      "gender": "female"
    },
    "conditions": {
      "resourceType": "Bundle",
      "entry": [
        {"resource": {"resourceType": "Condition", "code": {"coding": [{"code": "I48.91"}]}}},
        {"resource": {"resourceType": "Condition", "code": {"coding": [{"code": "I10"}]}}},
        {"resource": {"resourceType": "Condition", "code": {"coding": [{"code": "E11.9"}]}}}
      ]
    }
  }
}
```

**CDS Hooks Response:**

```json
{
  "cards": [{
    "uuid": "afib-anticoag-card-001",
    "summary": "CHA₂DS₂-VASc Score: 3 — HIGH Stroke Risk",
    "indicator": "warning",
    "detail": "This patient with atrial fibrillation has a CHA₂DS₂-VASc score of 3 (HTN +1, DM +1, Female +1), indicating 3.2% annual stroke risk. Oral anticoagulation is strongly recommended per 2023 ACC/AHA Guidelines.\n\nCurrent anticoagulation status: NOT ON ANTICOAGULATION",
    "source": {
      "label": "ACC/AHA 2023 Atrial Fibrillation Guidelines",
      "url": "https://www.ahajournals.org/doi/10.1161/CIR.0000000000001083",
      "icon": "https://www.heart.org/favicon.ico"
    },
    "suggestions": [{
      "label": "Start Apixaban 5mg BID",
      "uuid": "suggest-apixaban",
      "actions": [{
        "type": "create",
        "description": "Create prescription for Apixaban 5mg twice daily",
        "resource": {
          "resourceType": "MedicationRequest",
          "status": "draft",
          "intent": "proposal",
          "medicationCodeableConcept": {
            "coding": [{
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "1364435",
              "display": "Apixaban 5 MG Oral Tablet"
            }]
          },
          "subject": {"reference": "Patient/maria-rodriguez-12345"},
          "dosageInstruction": [{
            "text": "Take 5 mg by mouth twice daily",
            "timing": {"repeat": {"frequency": 2, "period": 1, "periodUnit": "d"}},
            "doseAndRate": [{"doseQuantity": {"value": 5, "unit": "mg"}}]
          }],
          "reasonCode": [{
            "coding": [{
              "system": "http://snomed.info/sct",
              "code": "49436004",
              "display": "Atrial fibrillation"
            }]
          }]
        }
      }]
    }],
    "links": [
      {
        "label": "View CHA₂DS₂-VASc Calculator",
        "url": "https://www.mdcalc.com/cha2ds2-vasc-score-atrial-fibrillation-stroke-risk",
        "type": "absolute"
      },
      {
        "label": "Review ACC/AHA Guidelines",
        "url": "https://www.ahajournals.org/doi/10.1161/CIR.0000000000001083",
        "type": "absolute"
      }
    ]
  }]
}
```

---

## 6.2 Risk Scores Implementation

### CHA₂DS₂-VASc Score Calculator

```python
"""
CHA2DS2-VASc Stroke Risk Calculator
Clinical decision support for atrial fibrillation management
"""

from dataclasses import dataclass
from datetime import date
from typing import List, Optional

@dataclass
class PatientContext:
    """Patient data needed for risk calculation."""
    birth_date: date
    gender: str  # 'male' or 'female'
    conditions: List[str]  # ICD-10 codes
    has_chf: bool = False
    has_hypertension: bool = False
    has_diabetes: bool = False
    has_stroke_tia: bool = False
    has_vascular_disease: bool = False


@dataclass
class RiskScore:
    """Risk calculation result."""
    score: int
    annual_stroke_risk: float
    recommendation: str
    factors: dict


def calculate_age(birth_date: date, reference_date: date = None) -> int:
    """Calculate age in years."""
    if reference_date is None:
        reference_date = date.today()

    age = reference_date.year - birth_date.year
    if (reference_date.month, reference_date.day) < (birth_date.month, birth_date.day):
        age -= 1
    return age


def calculate_cha2ds2_vasc(context: PatientContext) -> RiskScore:
    """
    Calculate CHA2DS2-VASc score for stroke risk in atrial fibrillation.

    Scoring:
    - C: Congestive heart failure (+1)
    - H: Hypertension (+1)
    - A2: Age ≥75 (+2)
    - D: Diabetes (+1)
    - S2: Stroke/TIA/thromboembolism (+2)
    - V: Vascular disease (+1)
    - A: Age 65-74 (+1)
    - Sc: Sex category - female (+1)
    """
    score = 0
    factors = {}

    # C: Congestive heart failure
    if context.has_chf or any(code.startswith('I50') for code in context.conditions):
        score += 1
        factors['CHF'] = 1

    # H: Hypertension
    if context.has_hypertension or 'I10' in context.conditions:
        score += 1
        factors['Hypertension'] = 1

    # A2: Age ≥75
    age = calculate_age(context.birth_date)
    if age >= 75:
        score += 2
        factors['Age ≥75'] = 2
    # A: Age 65-74
    elif age >= 65:
        score += 1
        factors['Age 65-74'] = 1

    # D: Diabetes
    if context.has_diabetes or any(code.startswith('E11') for code in context.conditions):
        score += 1
        factors['Diabetes'] = 1

    # S2: Stroke/TIA/thromboembolism
    stroke_codes = ['I63', 'I64', 'G45', 'I74']
    if context.has_stroke_tia or any(
        any(code.startswith(sc) for sc in stroke_codes)
        for code in context.conditions
    ):
        score += 2
        factors['Stroke/TIA'] = 2

    # V: Vascular disease
    vascular_codes = ['I25', 'I70', 'I71']  # CAD, PAD, aortic disease
    if context.has_vascular_disease or any(
        any(code.startswith(vc) for vc in vascular_codes)
        for code in context.conditions
    ):
        score += 1
        factors['Vascular disease'] = 1

    # Sc: Sex category (female)
    if context.gender.lower() == 'female':
        score += 1
        factors['Female sex'] = 1

    # Calculate annual stroke risk based on score
    risk_table = {
        0: 0.2,
        1: 0.6,
        2: 2.2,
        3: 3.2,
        4: 4.8,
        5: 7.2,
        6: 9.7,
        7: 11.2,
        8: 10.8,
        9: 12.2
    }
    annual_risk = risk_table.get(min(score, 9), 12.2)

    # Determine recommendation
    if context.gender.lower() == 'female':
        # For females, anticoagulation recommended if score ≥2
        if score >= 2:
            recommendation = "Oral anticoagulation strongly recommended"
        elif score == 1:
            recommendation = "Anticoagulation should be considered"
        else:
            recommendation = "No anticoagulation indicated"
    else:
        # For males, anticoagulation recommended if score ≥1
        if score >= 1:
            recommendation = "Oral anticoagulation recommended"
        else:
            recommendation = "No anticoagulation indicated"

    return RiskScore(
        score=score,
        annual_stroke_risk=annual_risk,
        recommendation=recommendation,
        factors=factors
    )


# Calculate Maria's score
maria = PatientContext(
    birth_date=date(1979, 3, 15),
    gender='female',
    conditions=['I48.91', 'I10', 'E11.9', 'E66.9'],
    has_hypertension=True,
    has_diabetes=True
)

result = calculate_cha2ds2_vasc(maria)
print(f"CHA2DS2-VASc Score: {result.score}")
print(f"Annual Stroke Risk: {result.annual_stroke_risk}%")
print(f"Recommendation: {result.recommendation}")
print(f"Factors: {result.factors}")

# Output:
# CHA2DS2-VASc Score: 3
# Annual Stroke Risk: 3.2%
# Recommendation: Oral anticoagulation strongly recommended
# Factors: {'Hypertension': 1, 'Diabetes': 1, 'Female sex': 1}
```

**Live Query Results: Risk Scores from OMOP CDM**

Maria's CHA₂DS₂-VASc and HAS-BLED scores are stored in the observation table:

```sql
-- Query: Clinical Risk Scores
SELECT
    o.observation_date,
    o.observation_source_value AS score_type,
    o.value_as_number AS score,
    o.value_as_string AS interpretation
FROM cdm.observation o
WHERE o.person_id = 12345
  AND o.observation_source_value IN ('CHA2DS2-VASc', 'HAS-BLED')
ORDER BY o.observation_source_value;
```

<div align="center">

| Observation Date | Score Type | Score | Interpretation |
|:----------------:|:-----------|:-----:|:---------------|
| 2026-01-13 | CHA2DS2-VASc | 3 | HIGH stroke risk |
| 2026-01-13 | HAS-BLED | 1 | LOW bleeding risk |

*Query returned 2 rows*

</div>

**SQL Implementation: CHA₂DS₂-VASc Score Calculation from OMOP Data**

```sql
-- Query: Calculate CHA2DS2-VASc Score from OMOP CDM data
WITH patient_data AS (
    SELECT
        p.person_id,
        p.gender_concept_id,
        EXTRACT(YEAR FROM AGE('2026-01-13', MAKE_DATE(p.year_of_birth, 1, 1))) AS age
    FROM cdm.person p
    WHERE p.person_id = 12345
),
condition_flags AS (
    SELECT
        p.person_id,
        MAX(CASE WHEN co.condition_concept_id = 316139 THEN 1 ELSE 0 END) AS has_chf,
        MAX(CASE WHEN co.condition_concept_id = 320128 THEN 1 ELSE 0 END) AS has_htn,
        MAX(CASE WHEN co.condition_concept_id = 201826 THEN 1 ELSE 0 END) AS has_dm,
        MAX(CASE WHEN co.condition_concept_id IN (312327, 443454) THEN 1 ELSE 0 END) AS has_stroke
    FROM cdm.person p
    LEFT JOIN cdm.condition_occurrence co ON p.person_id = co.person_id
    WHERE p.person_id = 12345
    GROUP BY p.person_id
)
SELECT
    pd.person_id,
    pd.age,
    CASE WHEN pd.gender_concept_id = 8532 THEN 'Female' ELSE 'Male' END AS gender,
    cf.has_chf AS "C (CHF)",
    cf.has_htn AS "H (HTN)",
    CASE WHEN pd.age >= 75 THEN 2 WHEN pd.age >= 65 THEN 1 ELSE 0 END AS "A (Age)",
    cf.has_dm AS "D (DM)",
    cf.has_stroke * 2 AS "S (Stroke)",
    CASE WHEN pd.gender_concept_id = 8532 THEN 1 ELSE 0 END AS "Sc (Female)",
    -- Calculate total score
    cf.has_chf + cf.has_htn +
    CASE WHEN pd.age >= 75 THEN 2 WHEN pd.age >= 65 THEN 1 ELSE 0 END +
    cf.has_dm + (cf.has_stroke * 2) +
    CASE WHEN pd.gender_concept_id = 8532 THEN 1 ELSE 0 END AS total_score
FROM patient_data pd
JOIN condition_flags cf ON pd.person_id = cf.person_id;
```

<div align="center">

| person_id | age | gender | C (CHF) | H (HTN) | A (Age) | D (DM) | S (Stroke) | Sc (Female) | total_score |
|:---------:|:---:|:------:|:-------:|:-------:|:-------:|:------:|:----------:|:-----------:|:-----------:|
| 12345 | 46 | Female | 0 | 1 | 0 | 1 | 0 | 1 | **3** |

</div>

This SQL query demonstrates how CDS algorithms can calculate risk scores directly from OMOP CDM data, enabling both real-time clinical alerts and retrospective population analysis.

---

## 6.3 Chapter 6 Summary

Clinical decision support transforms clinical knowledge into actionable guidance at the point of care. For Maria, CDS algorithms:

1. **Calculated her stroke risk** using the CHA₂DS₂-VASc score
2. **Recommended anticoagulation** based on evidence-based guidelines
3. **Flagged drug interactions** between Metoprolol and Metformin
4. **Identified care gaps** like the overdue diabetic eye exam

---

## 6.4 Interesting Facts

<div style="background-color: #cce5ff; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **CHA₂DS₂-VASc Acronym:** The strange capitalization represents point values. C=CHF(1), H=HTN(1), A₂=Age≥75(2), D=DM(1), S₂=Stroke(2), V=Vascular disease(1), A=Age 65-74(1), Sc=Sex category female(1). Maximum score is 9.

2. **The 5 Rights of CDS:** Effective clinical decision support delivers the right information, to the right person, in the right format, through the right channel, at the right time in the workflow.

3. **CDS Hooks Standard:** The HL7 CDS Hooks standard was created because traditional CDS was siloed within individual EHR systems. CDS Hooks allows any compliant service to provide decision support to any compliant EHR.

4. **Alert Fatigue Statistics:** A typical hospitalist encounters **10-100 clinical alerts per day**, and studies show physicians take less than **3 seconds** to respond to each alert—insufficient time for careful consideration.

5. **The Birth of CHA₂DS₂-VASc:** The original CHADS₂ score, created in 2001, was refined to CHA₂DS₂-VASc in 2010 to better stratify patients at low and moderate risk. Maria would score only 2 on CHADS₂ but 3 on CHA₂DS₂-VASc.

6. **AI in CDS:** Machine learning models are increasingly used for CDS, but the FDA requires careful validation. As of 2024, over **700 AI/ML medical devices** have received FDA clearance, many for clinical decision support applications.

</div>

---

## 6.5 References & Sources

### Clinical Guidelines

1. **Lip GYH, et al.** (2010). Refining Clinical Risk Stratification for Predicting Stroke and Thromboembolism in Atrial Fibrillation. *Chest*, 137(2), 263-272.

2. **Pisters R, et al.** (2010). A Novel User-Friendly Score (HAS-BLED) To Assess 1-Year Risk of Major Bleeding. *Chest*, 138(5), 1093-1100.

3. **Gage BF, et al.** (2001). Validation of Clinical Classification Schemes for Predicting Stroke: Results From the National Registry of Atrial Fibrillation. *JAMA*, 285(22), 2864-2870.

### Technical Standards

4. **HL7 International.** (2024). *CDS Hooks Specification*. https://cds-hooks.org/

5. **ONC.** (2020). *Clinical Decision Support: Final Rule*. Federal Register, 85(85), 25642-25961.

6. **OHDSI.** (2024). *OMOP CDM Patient-Level Prediction Framework*. https://ohdsi.github.io/PatientLevelPrediction/

### CDS Research

7. **Osheroff JA, et al.** (2012). *Improving Outcomes with Clinical Decision Support: An Implementer's Guide* (2nd ed.). HIMSS.

8. **Wright A, et al.** (2019). Analysis of Clinical Decision Support System Malfunctions: A Case Series and Survey. *Journal of the American Medical Informatics Association*, 26(6), 494-501.

9. **Sittig DF, Singh H.** (2012). A New Sociotechnical Model for Studying Health Information Technology in Complex Adaptive Healthcare Systems. *Quality and Safety in Health Care*, 19(Suppl 3), i68-i74.

### FDA & AI

10. **FDA.** (2024). *Artificial Intelligence and Machine Learning in Software as a Medical Device*. https://www.fda.gov/medical-devices/software-medical-device-samd/artificial-intelligence-and-machine-learning-software-medical-device

---

<div style="page-break-after: always;"></div>

---

# Chapter 7: Quality Measurement & Population Health

## 7.1 Clinical Narrative

### The Quality Dashboard

Sarah Johnson, MPH—Community Health Clinic's Quality Director—reviewed the quarterly quality dashboard. Maria Rodriguez appeared on several population health reports.

**Maria's Quality Measure Status:**

| HEDIS Measure | Status | Details |
|--------------|--------|---------|
| Diabetes: HbA1c Testing | MET | Tested 09/15/2025 |
| Diabetes: HbA1c <8% | NOT MET | 7.8% (just below threshold, but new reading may differ) |
| Diabetes: Eye Exam | GAP | Last exam 14 months ago |
| Diabetes: Nephropathy Screening | MET | eGFR checked 01/14/2026 |
| HTN: BP Control <140/90 | NOT MET | Last reading 148/92 |
| Anticoagulation for AFib | MET | Apixaban started 01/13/2026 |

---

<a id="table-71-hedis-bp"></a>

## 7.2 HEDIS Quality Measure Implementation

### Diabetes Eye Exam (CDC) Measure

```sql
-- HEDIS Comprehensive Diabetes Care: Eye Exam
-- Identifies diabetic patients who need eye exam

WITH diabetic_population AS (
    -- Identify patients with diabetes diagnosis
    SELECT DISTINCT co.person_id
    FROM condition_occurrence co
    JOIN concept_ancestor ca
        ON co.condition_concept_id = ca.descendant_concept_id
    WHERE ca.ancestor_concept_id IN (201826, 201254)  -- T2DM, T1DM
    AND co.condition_start_date <= CURRENT_DATE
),
recent_eye_exams AS (
    -- Find eye exams in past 12 months
    SELECT DISTINCT po.person_id
    FROM procedure_occurrence po
    JOIN concept c ON po.procedure_concept_id = c.concept_id
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
JOIN person p ON dp.person_id = p.person_id
LEFT JOIN recent_eye_exams re ON dp.person_id = re.person_id
WHERE re.person_id IS NULL  -- Only show patients with gap
ORDER BY p.person_source_value;
```

**Live Query Results: Blood Pressure Trend Analysis for Quality Reporting**

One of the most important quality measures is hypertension control. The following query tracks Maria's blood pressure over time:

```sql
-- Query: Blood Pressure Trend Across Visits
SELECT
    v.visit_start_date,
    MAX(CASE WHEN m.measurement_source_value = '8480-6' THEN m.value_as_number END) AS systolic,
    MAX(CASE WHEN m.measurement_source_value = '8462-4' THEN m.value_as_number END) AS diastolic,
    cs.care_site_name AS location
FROM cdm.visit_occurrence v
JOIN cdm.measurement m ON v.visit_occurrence_id = m.visit_occurrence_id
JOIN cdm.care_site cs ON v.care_site_id = cs.care_site_id
WHERE v.person_id = 12345
  AND m.measurement_source_value IN ('8480-6', '8462-4')
GROUP BY v.visit_start_date, cs.care_site_name
ORDER BY v.visit_start_date;
```

<div align="center">

| Visit Date | Systolic | Diastolic | Location |
|:----------:|:--------:|:---------:|:---------|
| 2026-01-13 | 148 | 92 | Community Health Clinic |
| 2026-01-17 | 142 | 88 | Springfield Cardiology Associates |
| 2026-01-27 | 132 | 82 | Community Health Clinic |

*Query returned 3 rows*

</div>

**Clinical Quality Interpretation:**

| Visit Date | BP Reading | HEDIS HTN Control (<140/90) | Trend |
|------------|------------|----------------------------|-------|
| 2026-01-13 | 148/92 | **NOT MET** | Baseline |
| 2026-01-17 | 142/88 | **NOT MET** | Improving ↓ |
| 2026-01-27 | 132/82 | **MET** ✓ | At goal |

This demonstrates the value of longitudinal data: Maria's blood pressure improved from Stage 2 hypertension (148/92) to controlled (<140/90) within two weeks of starting Metoprolol for her atrial fibrillation. The rate control medication had the secondary benefit of improving her blood pressure control, flipping her HTN quality measure from "gap" to "met."

**Live Query Results: Visit Summary for Care Team**

```sql
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
```

<div align="center">

| Visit ID | Visit Date | Visit Type | Care Site | Provider |
|:--------:|:----------:|:-----------|:----------|:---------|
| 900001 | 2026-01-13 | Outpatient Visit | Community Health Clinic | Sarah Chen, MD |
| 900002 | 2026-01-17 | Outpatient Visit | Springfield Cardiology Associates | Michael Torres, MD |
| 900003 | 2026-01-27 | Outpatient Visit | Community Health Clinic | Sarah Chen, MD |
| 900004 | 2026-02-14 | Outpatient Visit | Springfield Cardiology Associates | Michael Torres, MD |

*Query returned 4 rows*

</div>

---

<a id="table-72-quality-gaps"></a>

## 7.3 Chapter 7 Summary

### Key Takeaways

**Clinical Practice Insights:**

1. **Quality measures drive population health:** Sarah's dashboard identified Maria's overdue eye exam—a care gap that could lead to preventable diabetic retinopathy.

2. **Measures must be actionable:** Identifying gaps is only valuable if care teams can intervene. Maria's eye exam referral closed a quality gap and protected her vision.

3. **Denominator matters:** Maria is in the denominator for multiple diabetes measures because of her diagnosis. Understanding measure inclusion criteria is essential for accurate reporting.

**Technical Implementation Insights:**

1. **HEDIS standardizes measurement:** The Healthcare Effectiveness Data and Information Set enables comparison across health plans and providers using consistent definitions.

2. **OMOP enables population analytics:** The same CDM that supports research also powers quality measurement—one data model, multiple use cases.

3. **Gap identification requires complete data:** Quality gaps can appear artificially if data isn't complete (e.g., eye exam done elsewhere not recorded).

---

## 7.4 Interesting Facts

<div style="background-color: #fce4ec; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **HEDIS History:** HEDIS (Healthcare Effectiveness Data and Information Set) was created by **NCQA in 1991** with just 4 measures. Today, it includes over **90 measures** across multiple domains.

2. **The Cost of Diabetes:** Annual healthcare costs for a person with diabetes average **$16,750**, more than 2.3 times higher than costs for someone without diabetes. Quality measures like HbA1c control can reduce complications and costs.

3. **Pay-for-Performance:** Medicare Advantage plans can earn up to **5% bonus payments** based on quality star ratings, creating strong financial incentives for quality improvement.

4. **Diabetic Eye Disease:** Without screening and treatment, approximately **50% of patients with diabetic retinopathy** will become legally blind within 5 years. Early detection through annual exams prevents 90% of diabetes-related blindness.

5. **The Numerator/Denominator Dance:** A health plan can "improve" its diabetes control rate by either improving care (increasing the numerator) or removing patients from the denominator (unethical but it happens).

6. **Why 140/90?:** The blood pressure threshold of <140/90 mmHg for HTN control was established based on clinical trials showing this level reduces cardiovascular events. Recent guidelines debate whether 130/80 would be better.

</div>

---

## 7.5 References & Sources

### Quality Measurement Standards

1. **NCQA.** (2024). *HEDIS 2024: Technical Specifications for Health Plans*. National Committee for Quality Assurance.

2. **CMS.** (2024). *Quality Payment Program: MIPS Quality Measures*. https://qpp.cms.gov/mips/quality-measures

3. **NQF.** (2024). *National Quality Forum Measure List*. https://www.qualityforum.org/Measures_List.aspx

### Clinical Guidelines

4. **American Diabetes Association.** (2024). Standards of Care in Diabetes—2024: Retinopathy Screening. *Diabetes Care*, 47(Supplement 1), S138-S151.

5. **Whelton PK, et al.** (2018). 2017 ACC/AHA/AAPA/ABC/ACPM/AGS/APhA/ASH/ASPC/NMA/PCNA Guideline for the Prevention, Detection, Evaluation, and Management of High Blood Pressure in Adults. *Hypertension*, 71(6), e13-e115.

### Population Health

6. **American Diabetes Association.** (2023). *Economic Costs of Diabetes in the U.S. in 2022*. *Diabetes Care*, 46(3), 1-8.

7. **OHDSI.** (2024). *OHDSI Analytics Use Cases: Quality Measurement*. https://ohdsi.github.io/Hades/

---

<div style="page-break-after: always;"></div>

---

# Part V: Revenue Cycle & Compliance

# Chapter 8: Billing, Coding & Revenue Cycle

<a id="figure-81-revenue-cycle"></a>

## 8.1 Clinical Narrative

### Monday, January 20, 2026 — 9:00 AM

Tom Richards, Revenue Cycle Manager, reviewed the coding queue for the previous week's encounters. Maria Rodriguez's visits appeared on his worklist.

**Visit 1: PCP Office Visit (01/13/2026)**

| Element | Value | Rationale |
|---------|-------|-----------|
| CPT Code | 99215 | Established patient, high complexity |
| Modifier | None | Standard office visit |
| Primary Dx | I48.91 | Atrial fibrillation (new diagnosis) |
| Secondary Dx | E11.65 | T2DM with hyperglycemia |
| Secondary Dx | I10 | Essential hypertension |
| Procedure | 93000 | EKG, 12-lead with interpretation |
| E&M Complexity | High | New problem requiring urgent evaluation |

**Documentation Supporting 99215:**
- **History:** Extended (chronic conditions + new symptoms)
- **Exam:** Detailed cardiovascular and general
- **MDM:** High complexity
  - Multiple diagnoses
  - Prescription drug management with DOAC
  - Data reviewed (EKG, prior labs)

---

<a id="table-81-cpt-codes"></a>

## 8.2 Complete Billing Ontology Reference

### ICD-10-CM Codes Used in Maria's Care

| Code | Description | Category | DRG Impact |
|------|-------------|----------|------------|
| I48.91 | Unspecified atrial fibrillation | Cardiac arrhythmia | CC |
| I48.0 | Paroxysmal atrial fibrillation | Specific type | CC |
| E11.9 | T2DM without complications | Diabetes | CC |
| E11.65 | T2DM with hyperglycemia | Diabetes with complication | CC |
| I10 | Essential hypertension | Cardiovascular | No impact |
| E66.9 | Obesity, unspecified | Metabolic | No impact |

### CPT Codes for Maria's Services

| Code | Description | RVU | Medicare Rate |
|------|-------------|-----|---------------|
| 99214 | Office visit, established, moderate | 1.92 | ~$89 |
| 99215 | Office visit, established, high | 2.80 | ~$130 |
| 99205 | Office visit, new patient, high | 4.55 | ~$211 |
| 93000 | EKG, 12-lead, complete | 0.54 | ~$25 |
| 93306 | Echo, TTE complete | 4.85 | ~$225 |

### Revenue Codes (for Facility Billing)

| Code | Description | Use Case |
|------|-------------|----------|
| 0510 | Clinic - General | Outpatient primary care |
| 0730 | EKG/ECG | Cardiac testing |
| 0320 | Radiology - Dx | Imaging services |
| 0921 | Peripheral vascular | Echo studies |

---

<a id="table-83-revenue-summary"></a>

<a id="figure-82-claims-process"></a>

## 8.3 Claims Generation

**Professional Claim (CMS-1500 format):**

```
CLAIM: Maria Rodriguez - DOS 01/13/2026

BOX 21. DIAGNOSIS CODES:
A. I48.91  Unspecified atrial fibrillation
B. E11.65  Type 2 DM with hyperglycemia
C. I10     Essential hypertension
D. E66.9   Obesity, unspecified

BOX 24. SERVICE LINES:
Line 1:
  DOS: 01/13/2026
  POS: 11 (Office)
  CPT: 99215
  DX: A,B,C,D
  Charges: $180.00

Line 2:
  DOS: 01/13/2026
  POS: 11 (Office)
  CPT: 93000
  DX: A
  Charges: $55.00

TOTAL CHARGES: $235.00
```

**Live Query Results: Provider and Care Site Information**

```sql
-- Query: Care Team Information
SELECT
    pr.provider_id,
    pr.provider_name,
    pr.specialty_source_value AS specialty,
    pr.npi
FROM cdm.provider pr
WHERE pr.provider_id IN (70001, 70002, 70003, 70004);
```

<div align="center">

| Provider ID | Provider Name | Specialty | NPI |
|:-----------:|:--------------|:----------|:---:|
| 70001 | Sarah Chen, MD | Family Medicine | 1234567890 |
| 70002 | Lisa Brown, RN | Registered Nurse | — |
| 70003 | Michael Torres, MD | Cardiology | 0987654321 |
| 70004 | Jessica Martinez, PharmD | Pharmacist | — |

*Query returned 4 rows*

</div>

**Live Query Results: Procedure Codes for Billing**

The procedure_occurrence table stores CPT/HCPCS codes that drive revenue cycle:

```sql
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
```

<div align="center">

| Date | CPT Code | Procedure Description | Provider | Care Site |
|:----:|:--------:|:----------------------|:---------|:----------|
| 2026-01-13 | 93000 | EKG, 12-lead with interpretation | Sarah Chen, MD | Community Health Clinic |
| 2026-01-13 | 99214 | Office visit, established, moderate | Sarah Chen, MD | Community Health Clinic |
| 2026-01-17 | 93306 | Echocardiogram, complete | Michael Torres, MD | Springfield Cardiology Associates |
| 2026-01-17 | 99214 | Office visit, established, moderate | Michael Torres, MD | Springfield Cardiology Associates |
| 2026-01-27 | 99214 | Office visit, established, moderate | Sarah Chen, MD | Community Health Clinic |
| 2026-02-14 | 99214 | Office visit, established, moderate | Michael Torres, MD | Springfield Cardiology Associates |

*Query returned 6 rows*

</div>

**Revenue Cycle Insights:**

| Visit | Procedures | Estimated Medicare | Notes |
|-------|------------|-------------------|-------|
| 2026-01-13 PCP | 99214 + 93000 | ~$114 | EKG justified by new arrhythmia |
| 2026-01-17 Cardio | 99214 + 93306 | ~$314 | Echo for structural evaluation |
| 2026-01-27 PCP | 99214 | ~$89 | Follow-up, BP improved |
| 2026-02-14 Cardio | 99214 | ~$89 | AFib follow-up |

Total estimated charges for Maria's AFib workup and initial management: **~$606** across 4 visits. This demonstrates how a single clinical event (new AFib diagnosis) generates multiple billable encounters across settings—primary care and cardiology.

---

## 8.4 Chapter 8 Summary

### Key Takeaways

**Clinical Practice Insights:**

1. **Documentation drives reimbursement:** The 99215 code requires documentation of high medical decision-making complexity. Dr. Chen's thorough notes justified this higher-level code.

2. **Diagnosis specificity matters:** I48.91 (unspecified AFib) vs I48.0 (paroxysmal AFib) represents different clinical presentations. As Maria's type becomes clearer, the code should be updated.

3. **Multiple providers, multiple claims:** Maria's care generated claims from both CHC (primary care) and Springfield Cardiology—each billing independently for their services.

**Technical Implementation Insights:**

1. **CPT describes "what" was done:** The procedures performed during each visit are captured in CPT codes that translate directly to payment.

2. **ICD-10 describes "why":** Diagnosis codes justify medical necessity for each procedure. An EKG for a patient with AFib is covered; the same EKG without indication might be denied.

3. **RVUs determine payment:** Relative Value Units multiply by a conversion factor to determine Medicare payments, creating standardized pricing across the country.

---

## 8.5 Interesting Facts

<div style="background-color: #d1ecf1; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **CPT's Origins:** Current Procedural Terminology was created by the **American Medical Association in 1966** to standardize medical procedure coding. The AMA still owns and licenses CPT, earning over **$100 million annually** from licensing fees.

2. **The ICD-10 Transition:** The U.S. switched from ICD-9 to ICD-10 on **October 1, 2015**, after several delays. The transition required updating millions of software systems and retraining hundreds of thousands of coders.

3. **Upcoding Penalties:** Healthcare fraud related to billing costs the U.S. an estimated **$100 billion annually**. The False Claims Act allows whistleblowers to receive 15-30% of recovered funds.

4. **The 99215 Controversy:** A 2016 OIG study found that **E&M services were upcoded 14% of the time**, costing Medicare billions. In response, CMS simplified E&M documentation requirements in 2021.

5. **Why "Superbill"?:** The term comes from the paper form historically used to capture charges. It was "super" because it combined multiple functions: charge capture, diagnosis coding, and procedure documentation.

6. **Medicare's Birthday:** Medicare began on **July 30, 1965**, when President Lyndon Johnson signed it into law with former President Harry Truman as the first beneficiary.

</div>

---

## 8.6 References & Sources

### Billing & Coding Standards

1. **American Medical Association.** (2024). *CPT Professional Edition 2024*. Chicago: AMA Press.

2. **CMS.** (2024). *Medicare Claims Processing Manual: Chapter 12 - Physicians/Nonphysician Practitioners*. https://www.cms.gov/Regulations-and-Guidance/Guidance/Manuals/Downloads/clm104c12.pdf

3. **AHIMA.** (2024). *ICD-10-CM/PCS Coding Guidelines*. American Health Information Management Association.

### Compliance

4. **OIG.** (2016). *Inappropriate Medicare Payments for Evaluation and Management Services*. Office of Inspector General. https://oig.hhs.gov/oei/reports/oei-04-14-00520.asp

5. **False Claims Act.** 31 U.S.C. §§ 3729-3733.

### Revenue Cycle

6. **Healthcare Financial Management Association.** (2024). *Revenue Cycle Fundamentals*. https://www.hfma.org/topics/revenue-cycle.html

---

<div style="page-break-after: always;"></div>

---

# Part VI: Transitions & Outcomes

# Chapter 9: Care Transitions & Discharge

<a id="figure-91-transition-workflow"></a>

## 9.1 Clinical Narrative

### A Complication: Emergency Visit

**Saturday, February 8, 2026 — 2:45 AM**

Three weeks after her diagnosis, Maria woke with her heart racing. The palpitations were stronger than before, and she felt short of breath. Her pulse ox at home read 94%. Following the instructions she'd been given, she called 911.

At Springfield Memorial Hospital Emergency Department, the triage nurse obtained vitals:
- **HR:** 152 bpm, irregular
- **BP:** 118/76 mmHg
- **SpO2:** 93% on room air
- **RR:** 24 breaths/min

The ED physician, Dr. Martinez, reviewed Maria's records via the HIE. He could see:
- Recent AFib diagnosis (01/13/2026)
- Current medications (Apixaban, Metoprolol, Metformin, Lisinopril)
- Recent echo showing EF 55-60%
- Last labs from 01/14

**Diagnosis:** Atrial fibrillation with rapid ventricular response

Maria was admitted to the telemetry unit for rate control.

---

<a id="table-91-discharge-meds"></a>

## 9.2 Discharge Summary

After 24 hours of rate control with IV diltiazem followed by oral medication adjustment, Maria was stable for discharge:

```
DISCHARGE SUMMARY

Patient: Rodriguez, Maria
MRN: 12345
Admission Date: 02/08/2026
Discharge Date: 02/09/2026
Length of Stay: 1 day

ADMITTING DIAGNOSIS:
Atrial fibrillation with rapid ventricular response

DISCHARGE DIAGNOSES:
1. Atrial fibrillation with RVR, resolved
2. Type 2 Diabetes Mellitus
3. Essential Hypertension

HOSPITAL COURSE:
46 yo F with recently diagnosed AFib (01/2026) admitted with AFib with
RVR, HR 150s, mild dyspnea. Hemodynamically stable. Rate controlled
with IV diltiazem then transitioned to oral diltiazem 180mg ER daily
(Metoprolol switched to diltiazem for better rate control).
Anticoagulation continued with Apixaban. Stable for discharge after
24 hours with HR 70-80s. No evidence of acute decompensation.

DISCHARGE MEDICATIONS:
1. Apixaban 5mg - 1 tablet by mouth twice daily (CONTINUE)
2. Diltiazem ER 180mg - 1 tablet by mouth daily (NEW - replaces Metoprolol)
3. Metformin 1000mg - 1 tablet by mouth twice daily (CONTINUE)
4. Lisinopril 20mg - 1 tablet by mouth daily (CONTINUE)

MEDICATIONS DISCONTINUED:
- Metoprolol Succinate 50mg daily (changed to Diltiazem)

FOLLOW-UP:
1. PCP (Dr. Chen): 3-5 days - call Monday for appointment
2. Cardiology (Dr. Torres): 1 week - appointment already scheduled 02/14

DISCHARGE INSTRUCTIONS:
- Take all medications as prescribed
- Monitor pulse daily - call if >100 at rest
- Return to ED if: chest pain, severe shortness of breath, fainting,
  signs of stroke (face droop, arm weakness, speech difficulty)
- Bleeding precautions: avoid injury, seek care for prolonged bleeding

Discharged to: Home
Condition at discharge: Stable
Mode of transport: Private vehicle (husband)

Electronically signed: Amanda Williams, DO
02/09/2026 11:30 AM
```

---

## 9.3 Chapter 9 Summary

### Key Takeaways

**Clinical Practice Insights:**

1. **Transitions are high-risk periods:** Maria's readmission for AFib with RVR illustrates why care transitions require careful attention. Medication changes, new symptoms, and handoff communication all create vulnerability.

2. **HIE enables emergency care:** The ED physician could immediately see Maria's recent AFib diagnosis, current medications, and echo results—information that shaped treatment decisions within minutes of arrival.

3. **Discharge summaries are critical:** Dr. Williams's discharge summary communicated the medication change (Metoprolol→Diltiazem) and follow-up plan. Without this, Maria's PCP might not know about the change.

**Technical Implementation Insights:**

1. **ADT messages track patient location:** Admission-Discharge-Transfer messages notify downstream systems of Maria's hospital stay, triggering care coordination workflows.

2. **Medication reconciliation spans settings:** The transition from home→ED→inpatient→discharge requires multiple reconciliation points to ensure accuracy.

3. **C-CDA discharge summaries:** Structured discharge documents enable automatic import into receiving systems, reducing manual transcription errors.

---

## 9.4 Interesting Facts

<div style="background-color: #fff3cd; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **The 30-Day Readmission Problem:** Approximately **20% of Medicare patients** are readmitted within 30 days of discharge. CMS penalizes hospitals with excess readmissions—up to 3% of Medicare payments.

2. **Discharge Summary Delays:** Studies show that **only 12-34% of discharge summaries** are available to PCPs at the time of the first post-discharge visit, creating dangerous information gaps.

3. **The Hospital at Night Effect:** Mortality rates are higher for patients admitted on weekends, a phenomenon called the "weekend effect." Maria's Saturday admission represented a higher-risk scenario.

4. **Teach-Back Method:** The best discharge education uses "teach-back"—asking patients to explain instructions in their own words. This technique reduces readmissions by up to **30%**.

5. **Why "Transition of Care"?:** The term emphasizes that patient care doesn't stop at hospital walls. The Joint Commission requires specific "hand-off communication" standards for all care transitions.

6. **Diltiazem vs Metoprolol:** The switch from Metoprolol to Diltiazem for Maria wasn't random—diltiazem often provides better rate control in AFib, especially when beta-blockers alone are insufficient.

</div>

---

## 9.5 References & Sources

### Clinical Guidelines

1. **Kripalani S, et al.** (2007). Deficits in Communication and Information Transfer Between Hospital-Based and Primary Care Physicians. *JAMA*, 297(8), 831-841.

2. **Hansen LO, et al.** (2011). Interventions to Reduce 30-Day Rehospitalization: A Systematic Review. *Annals of Internal Medicine*, 155(8), 520-528.

### Technical Standards

3. **HL7 International.** (2024). *FHIR R4 Discharge Summary Implementation Guide*. http://hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html

4. **HL7 International.** (2024). *C-CDA R2.1: Discharge Summary Document Template*. http://www.hl7.org/ccdasearch/templates/2.16.840.1.113883.10.20.22.1.8.html

### Care Transitions

5. **Coleman EA, et al.** (2006). The Care Transitions Intervention: Results of a Randomized Controlled Trial. *Archives of Internal Medicine*, 166(17), 1822-1828.

6. **CMS.** (2024). *Hospital Readmissions Reduction Program (HRRP)*. https://www.cms.gov/Medicare/Medicare-Fee-for-Service-Payment/AcuteInpatientPPS/Readmissions-Reduction-Program

7. **Joint Commission.** (2024). *Transitions of Care Portal*. https://www.jointcommission.org/resources/patient-safety-topics/transitions-of-care/

---

<div style="page-break-after: always;"></div>

---

# Chapter 10: Outcomes, Research & Continuous Improvement

<a id="table-101-outcomes"></a>

## 10.1 Six-Month Follow-Up

### July 2026: Maria's Progress

Six months after her initial AFib diagnosis, Maria returned for routine follow-up. Let's examine her outcomes:

**Clinical Outcomes:**

| Metric | Baseline (Jan) | 6 Months (Jul) | Target | Status |
|--------|----------------|----------------|--------|--------|
| HbA1c | 7.8% | 7.1% | <7% | Improved |
| Blood Pressure | 148/92 | 126/78 | <130/80 | At goal |
| Heart Rate | 98 irregular | 72 regular | 60-80 | Controlled |
| Weight | 187 lbs | 178 lbs | <175 | Improving |
| AFib Episodes | New onset | Rare paroxysmal | Minimized | Controlled |
| Stroke/TIA | N/A | None | None | Success |
| Major Bleeding | N/A | None | None | Success |
| ER Visits | N/A | 1 (RVR) | Minimize | Expected |

---

<a id="table-102-cohort-definition"></a>

## 10.2 Patient-Level Prediction

### 30-Day Readmission Risk Model

Using Maria's data, we can demonstrate a simple patient-level prediction model:

```python
"""
30-Day Readmission Risk Prediction
Patient-level prediction for hospital readmission
"""

import numpy as np
from dataclasses import dataclass
from typing import Dict

@dataclass
class ReadmissionPrediction:
    risk_score: float
    risk_category: str
    contributing_factors: Dict[str, float]


def predict_30day_readmission(
    age: int,
    gender: str,
    num_diagnoses: int,
    num_medications: int,
    length_of_stay: int,
    prior_admissions_6mo: int,
    has_chf: bool,
    has_diabetes: bool,
    has_afib: bool,
    eGFR: float,
    discharge_disposition: str
) -> ReadmissionPrediction:
    """
    Simple logistic regression-style readmission prediction.

    In production, this would use a trained ML model (e.g., XGBoost,
    Random Forest) with proper cross-validation and calibration.
    """

    # Baseline risk
    log_odds = -3.5
    factors = {}

    # Age effect (increased risk with age)
    if age >= 65:
        log_odds += 0.3
        factors['Age ≥65'] = 0.3
    elif age >= 75:
        log_odds += 0.6
        factors['Age ≥75'] = 0.6

    # Gender effect
    if gender.lower() == 'male':
        log_odds += 0.1
        factors['Male'] = 0.1

    # Comorbidity burden
    if num_diagnoses > 5:
        log_odds += 0.4
        factors['Multiple diagnoses'] = 0.4

    # Polypharmacy
    if num_medications > 5:
        log_odds += 0.2
        factors['Polypharmacy'] = 0.2

    # Length of stay
    if length_of_stay > 3:
        log_odds += 0.3
        factors['Extended LOS'] = 0.3

    # Prior admissions
    if prior_admissions_6mo > 0:
        log_odds += 0.5 * prior_admissions_6mo
        factors['Prior admissions'] = 0.5 * prior_admissions_6mo

    # Specific conditions
    if has_chf:
        log_odds += 0.6
        factors['Heart failure'] = 0.6

    if has_diabetes:
        log_odds += 0.2
        factors['Diabetes'] = 0.2

    if has_afib:
        log_odds += 0.15
        factors['Atrial fibrillation'] = 0.15

    # Renal function
    if eGFR < 30:
        log_odds += 0.5
        factors['Severe CKD'] = 0.5
    elif eGFR < 60:
        log_odds += 0.2
        factors['Moderate CKD'] = 0.2

    # Discharge disposition
    if discharge_disposition == 'home':
        log_odds -= 0.1
        factors['Discharge to home'] = -0.1
    elif discharge_disposition == 'snf':
        log_odds += 0.4
        factors['Discharge to SNF'] = 0.4

    # Convert to probability
    risk_score = 1 / (1 + np.exp(-log_odds))

    # Categorize risk
    if risk_score < 0.10:
        risk_category = 'Low'
    elif risk_score < 0.20:
        risk_category = 'Moderate'
    else:
        risk_category = 'High'

    return ReadmissionPrediction(
        risk_score=round(risk_score * 100, 1),
        risk_category=risk_category,
        contributing_factors=factors
    )


# Predict Maria's readmission risk after her February admission
maria_prediction = predict_30day_readmission(
    age=46,
    gender='female',
    num_diagnoses=4,
    num_medications=4,
    length_of_stay=1,
    prior_admissions_6mo=0,
    has_chf=False,
    has_diabetes=True,
    has_afib=True,
    eGFR=82,
    discharge_disposition='home'
)

print(f"30-Day Readmission Risk: {maria_prediction.risk_score}%")
print(f"Risk Category: {maria_prediction.risk_category}")
print(f"Contributing Factors: {maria_prediction.contributing_factors}")

# Output:
# 30-Day Readmission Risk: 5.2%
# Risk Category: Low
# Contributing Factors: {'Diabetes': 0.2, 'Atrial fibrillation': 0.15, 'Discharge to home': -0.1}
```

---

<a id="figure-102-ohdsi-flow"></a>

## 10.3 Research Applications

### OMOP CDM Research Query: AFib Outcomes Study

```sql
-- Research Query: 1-Year Stroke Rate in Anticoagulated AFib Patients
-- OMOP CDM Schema

WITH afib_cohort AS (
    SELECT DISTINCT
        co.person_id,
        MIN(co.condition_start_date) AS afib_diagnosis_date
    FROM condition_occurrence co
    WHERE co.condition_concept_id IN (
        SELECT descendant_concept_id
        FROM concept_ancestor
        WHERE ancestor_concept_id = 313217  -- Atrial fibrillation
    )
    GROUP BY co.person_id
),
anticoagulated AS (
    SELECT
        a.person_id,
        a.afib_diagnosis_date,
        MIN(de.drug_exposure_start_date) AS anticoag_start_date
    FROM afib_cohort a
    JOIN drug_exposure de ON a.person_id = de.person_id
    WHERE de.drug_concept_id IN (
        SELECT descendant_concept_id
        FROM concept_ancestor
        WHERE ancestor_concept_id IN (
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
    LEFT JOIN condition_occurrence co
        ON ac.person_id = co.person_id
        AND co.condition_concept_id IN (
            SELECT descendant_concept_id
            FROM concept_ancestor
            WHERE ancestor_concept_id = 381591  -- Ischemic stroke
        )
        AND co.condition_start_date
            BETWEEN ac.anticoag_start_date AND ac.anticoag_start_date + 365
    GROUP BY ac.person_id, ac.afib_diagnosis_date, ac.anticoag_start_date
)
SELECT
    COUNT(*) AS total_patients,
    SUM(CASE WHEN stroke_date IS NOT NULL THEN 1 ELSE 0 END) AS stroke_events,
    ROUND(
        100.0 * SUM(CASE WHEN stroke_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS stroke_rate_percent,
    AVG(DATEDIFF(day, anticoag_start_date, stroke_date)) AS avg_days_to_stroke
FROM stroke_outcomes;
```

---

## 10.4 Lessons Learned: Maria's Journey

Maria's case illustrates several key principles of clinical informatics:

1. **Early detection matters:** Lisa's recognition of irregular pulse during triage led to same-day diagnosis of a potentially life-threatening condition.

2. **Structured data enables decision support:** The CDS system used Maria's coded diagnoses to calculate her stroke risk and recommend anticoagulation.

3. **Care coordination requires information flow:** The referral to cardiology succeeded because the C-CDA document transferred Maria's complete clinical context.

4. **Medications require vigilance:** The pharmacist's review caught a drug interaction and provided critical patient education.

5. **Quality measurement drives improvement:** Population health analytics identified Maria's overdue eye exam, a gap that could have led to preventable vision loss.

6. **Research depends on standardized data:** Maria's de-identified data, mapped to OMOP CDM, will contribute to studies that improve care for future AFib patients.

---

## 10.5 Chapter 10 Summary

### Key Takeaways

**Clinical Practice Insights:**

1. **Outcomes complete the loop:** Maria's 6-month follow-up showed improved BP control, stable HbA1c, and no stroke events—demonstrating that her care plan was working.

2. **Continuous improvement requires measurement:** By tracking Maria's metrics over time, the care team could identify what's working and what needs adjustment.

3. **Patients become research participants:** With proper consent and de-identification, Maria's journey contributes to AFib research that will improve care for millions of future patients.

**Technical Implementation Insights:**

1. **Patient-level prediction models:** Machine learning models trained on OMOP CDM data can predict readmission risk, enabling proactive intervention for high-risk patients.

2. **OHDSI network enables multi-site research:** Standardized data across the OHDSI network allows research questions to be answered using data from millions of patients worldwide.

3. **Research and operations share infrastructure:** The same OMOP CDM that powers quality dashboards and CDS also enables cutting-edge observational research.

---

## 10.6 Interesting Facts

<div style="background-color: #e8f5e9; padding: 15px; border-radius: 8px; margin: 15px 0;">

**Did You Know?**

1. **OHDSI's Scale:** The OHDSI (Observational Health Data Sciences and Informatics) network includes data from over **800 million patients** across 80+ countries, making it the largest clinical research network in history.

2. **The OMOP CDM Story:** OMOP (Observational Medical Outcomes Partnership) was a public-private partnership initiated by the FDA in 2008 to improve drug safety surveillance. The CDM it produced became the foundation for OHDSI.

3. **Prediction Model Performance:** Studies show that machine learning readmission prediction models typically achieve **AUC scores of 0.65-0.75**—useful for risk stratification but not perfect. Human judgment remains essential.

4. **The Learning Health System:** The concept of a "learning health system" where clinical care continuously generates knowledge that improves care was articulated by the **Institute of Medicine in 2007**. Maria's data contributes to this vision.

5. **De-identification Challenges:** HIPAA's Safe Harbor method requires removing 18 specific identifiers, but studies have shown that even de-identified data can sometimes be re-identified. The OHDSI community uses additional privacy-preserving techniques.

6. **Real-World Evidence (RWE):** The FDA now accepts Real-World Evidence from sources like OHDSI for regulatory decisions. In 2023, **the FDA approved drug label changes** based entirely on OHDSI network studies.

</div>

---

## 10.7 References & Sources

### OHDSI & OMOP

1. **Hripcsak G, et al.** (2015). Observational Health Data Sciences and Informatics (OHDSI): Opportunities for Observational Researchers. *Studies in Health Technology and Informatics*, 216, 574-578.

2. **OHDSI.** (2024). *The Book of OHDSI*. https://ohdsi.github.io/TheBookOfOhdsi/

3. **Overhage JM, et al.** (2012). Validation of a Common Data Model for Active Safety Surveillance Research. *Journal of the American Medical Informatics Association*, 19(1), 54-60.

### Patient-Level Prediction

<a id="figure-101-plp-pipeline"></a>


4. **Reps JM, et al.** (2018). Design and Implementation of a Standardized Framework to Generate and Evaluate Patient-Level Prediction Models Using Observational Healthcare Data. *Journal of the American Medical Informatics Association*, 25(8), 969-975.

5. **OHDSI.** (2024). *Patient-Level Prediction Package*. https://ohdsi.github.io/PatientLevelPrediction/

### Learning Health Systems

6. **Institute of Medicine.** (2007). *The Learning Healthcare System: Workshop Summary*. National Academies Press.

7. **Friedman CP, et al.** (2010). Toward a Science of Learning Systems: A Research Agenda for the High-Functioning Learning Health System. *Journal of the American Medical Informatics Association*, 22(1), 43-50.

### Real-World Evidence

8. **FDA.** (2021). *Real-World Evidence Program*. https://www.fda.gov/science-research/science-and-research-special-topics/real-world-evidence

9. **Sherman RE, et al.** (2016). Real-World Evidence—What Is It and What Can It Tell Us? *New England Journal of Medicine*, 375(23), 2293-2297.

---

<div style="page-break-after: always;"></div>

---

# Appendices

# Appendix A: Complete Terminology Reference

## A.1 ICD-10-CM Structure

The International Classification of Diseases, 10th Revision, Clinical Modification follows a hierarchical structure:

![ICD-10-CM Code Structure](../assets/infographics/18_icd10_structure.svg)

*Figure A.1: ICD-10-CM Code Structure — Character positions and hierarchy from chapter to category, with Maria's diagnosis codes (E11.65 and I48.91) as examples*

## A.2 CPT Code Categories

![CPT Code Categories](../assets/infographics/19_cpt_categories.svg)

*Figure A.2: CPT Code Categories — Category I (E&M Services and Procedures), Category II (Performance Measures), and Category III (Emerging Technology) with Maria's billed codes highlighted*

## A.3 LOINC Code Axes

![LOINC Code Axes](../assets/infographics/20_loinc_axes.svg)

*Figure A.3: LOINC Six-Axis Structure — Component, Property, Time, System, Scale, and Method axes with Maria's glucose test (LOINC 2345-7) as example*

---

# Appendix B: FHIR Resource Mapping Guide

## B.1 Core Clinical Resources

| Clinical Concept | FHIR Resource | Key Elements |
|-----------------|---------------|--------------|
| Patient demographics | Patient | identifier, name, birthDate, gender |
| Office visit | Encounter | status, class, period, participant |
| Diagnosis | Condition | code, clinicalStatus, onsetDateTime |
| Vital signs | Observation | code (LOINC), valueQuantity |
| Lab results | Observation + DiagnosticReport | code, valueQuantity, interpretation |
| Medications | MedicationStatement, MedicationRequest | medication, dosage, status |
| Procedures | Procedure | code (CPT/SNOMED), performedDateTime |
| Referrals | ServiceRequest | code, intent, performer |
| Care plans | CarePlan | status, intent, activity |
| Insurance | Coverage | status, type, payor, beneficiary |

## B.2 HL7 v2 to FHIR Mapping

| HL7 v2 Segment | FHIR Resource |
|----------------|---------------|
| PID | Patient |
| PV1 | Encounter |
| DG1 | Condition |
| OBX | Observation |
| OBR | DiagnosticReport |
| RXA | MedicationAdministration |
| RXE | MedicationRequest |
| IN1 | Coverage |

---

# Appendix C: OMOP CDM Quick Reference

## C.1 Clinical Data Tables

| Table | Purpose | Key Fields |
|-------|---------|------------|
| person | Patient demographics | person_id, gender_concept_id, year_of_birth, race_concept_id |
| visit_occurrence | Encounters | visit_occurrence_id, visit_concept_id, visit_start_date |
| condition_occurrence | Diagnoses | condition_concept_id, condition_start_date |
| drug_exposure | Medications | drug_concept_id, drug_exposure_start_date, quantity |
| procedure_occurrence | Procedures | procedure_concept_id, procedure_date |
| measurement | Labs/Vitals | measurement_concept_id, value_as_number, unit_concept_id |
| observation | Other observations | observation_concept_id, value_as_string |

## C.2 Vocabulary Tables

| Table | Purpose |
|-------|---------|
| concept | All standard concepts with concept_id, concept_name, domain_id |
| concept_relationship | Relationships between concepts (maps to, is a) |
| concept_ancestor | Hierarchical relationships for roll-up queries |
| vocabulary | Source vocabularies (SNOMED, ICD10CM, RxNorm, etc.) |

---

# Appendix D: Billing Code Crosswalk

## D.1 Diagnosis Mapping (ICD-10 to SNOMED to OMOP)

| ICD-10-CM | SNOMED CT | OMOP Concept | Description |
|-----------|-----------|--------------|-------------|
| I48.91 | 49436004 | 313217 | Atrial fibrillation |
| I10 | 38341003 | 320128 | Essential hypertension |
| E11.9 | 44054006 | 201826 | Type 2 diabetes mellitus |
| E66.9 | 414916001 | 433736 | Obesity |
| I63.9 | 422504002 | 443454 | Ischemic stroke |

## D.2 Procedure Mapping (CPT to SNOMED to OMOP)

| CPT | SNOMED CT | OMOP Concept | Description |
|-----|-----------|--------------|-------------|
| 99215 | 185349003 | 9202 (visit) | Office visit, established, high |
| 93000 | 29303009 | 4013643 | EKG, 12-lead |
| 93306 | 40701008 | 4180793 | Echocardiogram, TTE |

---

## End of Textbook

*Clinical Informatics: A Provider's Journey Through Healthcare Data*

This textbook has followed Maria Rodriguez through a complete care journey—from her first phone call to Community Health Clinic through diagnosis, treatment, hospitalization, and long-term management of atrial fibrillation. Along the way, we've explored:

- **Clinical workflows** that generate healthcare data
- **Documentation practices** that capture clinical reasoning
- **Data standards** that enable interoperability (HL7, FHIR, OMOP)
- **Terminology systems** that standardize clinical concepts (ICD-10, CPT, LOINC, SNOMED, RxNorm)
- **Clinical decision support** that guides evidence-based care
- **Quality measurement** that drives continuous improvement
- **Revenue cycle** processes that sustain healthcare operations
- **Research applications** that improve care for future patients

The nurse informaticist stands at the intersection of all these domains, translating between clinical practice and technology, ensuring that data serves patients rather than burdening clinicians.

Maria's story continues. Her data—now standardized, coded, and flowing through research networks—will help answer questions we haven't yet thought to ask. That is the promise of clinical informatics: better data, better decisions, better care.

---

*Jennifer Torres, MSN, RN-BC*
*Nurse Informaticist*
*January 2026*

---

<div style="page-break-after: always;"></div>

---

# Glossary of Terms

This glossary provides definitions for clinical, technical, and informatics terms used throughout this textbook. Terms are organized alphabetically for easy reference.

---

## A

**ADT (Admission-Discharge-Transfer)**
: HL7 message category used to communicate patient movement events within and between healthcare facilities. ADT^A01 indicates admission, ADT^A03 indicates discharge.

**AFib (Atrial Fibrillation)**
: A cardiac arrhythmia characterized by rapid, irregular electrical activity in the atria, leading to an irregularly irregular pulse. Increases stroke risk significantly.

**Alert Fatigue**
: A phenomenon where clinicians become desensitized to clinical alerts due to excessive volume, leading to important warnings being ignored or overridden.

**AHIMA (American Health Information Management Association)**
: Professional organization for health information management professionals, focusing on medical records, coding, and health data standards.

**Anticoagulation**
: Treatment to prevent blood clot formation. For AFib patients, anticoagulation (e.g., apixaban) reduces stroke risk by preventing clots from forming in the heart.

**API (Application Programming Interface)**
: A set of protocols and tools for building software applications. In healthcare, APIs enable different systems to exchange data (e.g., FHIR APIs).

**ATHENA**
: The official vocabulary browser for OMOP standardized vocabularies, maintained by OHDSI. Available at athena.ohdsi.org.

---

## B

**Beta-blocker**
: A class of medications (e.g., metoprolol) that slow heart rate by blocking beta-adrenergic receptors. Used for rate control in AFib.

**Billing Code**
: A standardized code used to identify healthcare services for reimbursement purposes. Includes CPT codes for procedures and ICD-10 codes for diagnoses.

**BMI (Body Mass Index)**
: A measure of body fat based on height and weight. Calculated as weight (kg) / height (m)². Normal range: 18.5-24.9; Obesity: ≥30.

---

## C

**C-CDA (Consolidated Clinical Document Architecture)**
: An HL7 standard for structured clinical documents, enabling exchange of patient summaries between EHR systems. Includes templates for discharge summaries, referral notes, and care plans.

**Care Coordination**
: The deliberate organization of patient care activities between multiple providers and settings to ensure appropriate, efficient delivery of healthcare services.

**Care Gap**
: A discrepancy between recommended care and care actually received. Quality programs identify care gaps (e.g., overdue diabetic eye exam) to prompt interventions.

**CDS (Clinical Decision Support)**
: Computer-based systems that provide clinicians with knowledge and patient-specific information to enhance clinical decisions. Includes alerts, reminders, and order sets.

**CDS Hooks**
: An HL7 standard for integrating clinical decision support services with EHR systems. Enables "hook" points where external CDS can provide recommendations.

**CDM (Common Data Model)**
: A standardized data structure that enables consistent representation of healthcare data across different source systems. OMOP CDM is the primary example.

**CHA₂DS₂-VASc Score**
: A clinical prediction rule for estimating stroke risk in patients with atrial fibrillation. Components: Congestive heart failure, Hypertension, Age≥75 (2 points), Diabetes, Stroke history (2 points), Vascular disease, Age 65-74, Sex category (female). Score of 0-1 is low risk; ≥2 warrants anticoagulation.

**Chief Complaint**
: The primary reason a patient seeks medical care, typically documented in the patient's own words.

**CLIA (Clinical Laboratory Improvement Amendments)**
: Federal regulations establishing quality standards for laboratory testing to ensure accuracy, reliability, and timeliness of results.

**CMS (Centers for Medicare & Medicaid Services)**
: Federal agency that administers Medicare, Medicaid, and related programs. Sets reimbursement policies and quality measurement standards.

**Concept ID**
: A unique numeric identifier for a clinical concept in a terminology system. In OMOP, concept_id links clinical data to standardized vocabulary definitions.

**Condition Occurrence**
: An OMOP CDM table that stores diagnosis information, including condition_concept_id (standardized diagnosis) and condition_source_value (original code).

**CPOE (Computerized Provider Order Entry)**
: Electronic system for entering and managing medical orders, replacing handwritten orders. Enables CDS integration and reduces transcription errors.

**CPT (Current Procedural Terminology)**
: A coding system maintained by the AMA for reporting medical procedures and services. Used for billing and reimbursement.

**Critical Value**
: A laboratory result that represents a potentially life-threatening condition requiring immediate notification of the responsible clinician.

---

## D

**De-identification**
: The process of removing or obscuring personal identifiers from health data to protect patient privacy while enabling research use.

**DICOM (Digital Imaging and Communications in Medicine)**
: The international standard for medical imaging data and communication. Used for radiology, cardiology, and other imaging modalities.

**Discharge Summary**
: A clinical document summarizing a patient's hospital stay, including diagnoses, treatments, and follow-up instructions. Critical for care transitions.

**DOAC (Direct Oral Anticoagulant)**
: A class of anticoagulants (e.g., apixaban, rivaroxaban) that directly inhibit specific clotting factors. Preferred over warfarin for most AFib patients.

**Drug Exposure**
: An OMOP CDM table that records medication administration and dispensing events, including drug_concept_id and dosing information.

**DRG (Diagnosis-Related Group)**
: A patient classification system used by Medicare to determine hospital payment. Groups patients with similar diagnoses and resource needs.

---

## E

**E&M (Evaluation and Management)**
: A category of CPT codes (99201-99499) for cognitive physician services, including office visits, hospital care, and consultations. Coding level depends on complexity.

**Echo (Echocardiogram)**
: An ultrasound imaging study of the heart that evaluates structure and function. TTE (transthoracic) is the standard approach.

**EF (Ejection Fraction)**
: A measurement of heart pumping efficiency, expressed as the percentage of blood ejected from the left ventricle with each heartbeat. Normal: 55-70%.

**EHR (Electronic Health Record)**
: A digital version of a patient's medical record, maintained by healthcare providers. Enables documentation, order entry, and clinical decision support.

**Eligibility Verification**
: The process of confirming a patient's insurance coverage before services are rendered, typically using X12 270/271 transactions.

**ETL (Extract, Transform, Load)**
: A data integration process that extracts data from source systems, transforms it to a target format (e.g., OMOP CDM), and loads it into a data warehouse.

---

## F

**FHIR (Fast Healthcare Interoperability Resources)**
: An HL7 standard for exchanging healthcare information electronically. Uses modern web technologies (REST, JSON, XML) and defines resources for clinical concepts.

**FQHC (Federally Qualified Health Center)**
: Community-based healthcare organizations that receive federal funding to provide primary care services to underserved populations.

---

## G

**Gap Analysis**
: In quality measurement, the process of identifying patients who are due for recommended care but haven't received it.

---

## H

**HAS-BLED Score**
: A clinical prediction rule for estimating bleeding risk in patients on anticoagulation. Components: Hypertension, Abnormal renal/liver function, Stroke, Bleeding history, Labile INR, Elderly (>65), Drugs/alcohol.

**HbA1c (Hemoglobin A1c)**
: A blood test measuring average blood glucose over 2-3 months. Target for most diabetics: <7%. Maria's 8.2% indicates suboptimal control.

**HEDIS (Healthcare Effectiveness Data and Information Set)**
: A standardized set of performance measures used by health plans to evaluate quality of care. Maintained by NCQA.

**HIE (Health Information Exchange)**
: The electronic sharing of patient health information between different healthcare organizations. Also refers to organizations that facilitate this exchange.

**HIPAA (Health Insurance Portability and Accountability Act)**
: Federal law establishing privacy and security standards for protected health information (PHI).

**HL7 (Health Level Seven)**
: An international standards organization focused on healthcare data exchange. Produces HL7 v2.x messaging standards and FHIR.

**HPI (History of Present Illness)**
: The narrative portion of clinical documentation describing the patient's current symptoms, including onset, duration, severity, and associated factors.

---

## I

**ICD-10-CM (International Classification of Diseases, 10th Revision, Clinical Modification)**
: The U.S. adaptation of WHO's ICD-10 for diagnosis coding. Used for billing and epidemiological reporting.

**Interoperability**
: The ability of different healthcare information systems to exchange, interpret, and use data. Semantic interoperability ensures shared meaning.

---

## L

**LIS (Laboratory Information System)**
: Software that manages laboratory operations, including specimen tracking, result reporting, and quality control.

**LOINC (Logical Observation Identifiers Names and Codes)**
: A universal coding system for laboratory tests and clinical observations. Each LOINC code uniquely identifies a specific test (e.g., 8480-6 for systolic BP).

---

## M

**Master Patient Index (MPI)**
: A database that maintains a unique identifier for each patient and links all records for that patient across different systems.

**MDM (Medical Decision Making)**
: In E&M coding, the process of selecting diagnosis and treatment options. Complexity levels (straightforward, low, moderate, high) determine E&M code level.

**Measurement**
: An OMOP CDM table that stores quantitative clinical observations, including vital signs and laboratory results.

**Medication Reconciliation**
: The process of comparing a patient's medication orders to all medications the patient is taking to avoid errors and ensure accuracy.

**MIPS (Merit-based Incentive Payment System)**
: A CMS program that adjusts Medicare payments based on quality, cost, improvement activities, and promoting interoperability.

**MRN (Medical Record Number)**
: A unique identifier assigned to a patient within a healthcare organization. Different organizations may assign different MRNs to the same patient.

---

## N

**NCPDP (National Council for Prescription Drug Programs)**
: Organization that develops standards for electronic prescribing (SCRIPT) and pharmacy claims processing.

**NCQA (National Committee for Quality Assurance)**
: A nonprofit organization that develops and maintains HEDIS quality measures and accredits health plans.

**NDC (National Drug Code)**
: A unique 10-digit identifier for drug products in the U.S. Identifies the labeler, product, and package size.

**NLP (Natural Language Processing)**
: AI techniques for extracting structured information from unstructured clinical text, such as progress notes.

**NPI (National Provider Identifier)**
: A unique 10-digit identification number for healthcare providers required by HIPAA. Used for billing and identification.

---

## O

**Observation**
: An OMOP CDM table for storing clinical observations that don't fit into other domain tables, such as social history and risk scores.

**OHDSI (Observational Health Data Sciences and Informatics)**
: An international collaborative focused on large-scale analytics using the OMOP CDM. Pronounced "odyssey."

**OMOP (Observational Medical Outcomes Partnership)**
: A public-private partnership that developed the OMOP Common Data Model for observational research. Now maintained by OHDSI.

**Order Set**
: A pre-defined group of orders for a specific clinical scenario (e.g., "New AFib Workup"), promoting standardization and efficiency.

**ORM (Order Message)**
: An HL7 v2 message type for transmitting orders from an ordering system to a fulfilling system (e.g., ORM^O01 for new orders).

**ORU (Observation Result Unsolicited)**
: An HL7 v2 message type for transmitting results from a performing system to a requesting system (e.g., ORU^R01 for lab results).

---

## P

**Patient-Level Prediction**
: The use of machine learning models to predict individual patient outcomes, such as 30-day readmission risk.

**Person**
: The OMOP CDM table that stores patient demographic information, including person_id, gender, birth year, and race.

**Phenotype**
: In informatics, a computable definition of a clinical condition or patient characteristic used to identify cohorts in electronic health data.

**PHI (Protected Health Information)**
: Individually identifiable health information protected under HIPAA, including demographics, diagnoses, and treatment information.

**PLP (Patient-Level Prediction)**
: An OHDSI framework for developing and validating predictive models using OMOP CDM data.

**POC (Point of Care)**
: Testing or treatment performed at or near the patient location, such as bedside glucose testing.

**Population Health**
: The health outcomes of a group of individuals, including the distribution of outcomes within the group. Population health management uses data to improve outcomes.

**Prior Authorization**
: A requirement that healthcare providers obtain approval from insurance plans before delivering certain services or medications.

**Problem List**
: A longitudinal record of a patient's significant diagnoses and health concerns, maintained in the EHR.

**Procedure Occurrence**
: An OMOP CDM table that stores records of clinical procedures, including procedure_concept_id (CPT/SNOMED) and procedure_date.

---

## Q

**Quality Measure**
: A standardized metric for assessing healthcare quality, typically expressed as a rate (numerator/denominator). HEDIS measures are the most common.

---

## R

**Rate Control**
: A treatment strategy for AFib that focuses on controlling heart rate rather than restoring normal rhythm. Beta-blockers and calcium channel blockers are used.

**Real-World Evidence (RWE)**
: Clinical evidence derived from real-world data (observational data), as opposed to randomized controlled trials.

**Referral**
: A request for a patient to be seen by another provider, typically a specialist. Documented as a ServiceRequest in FHIR.

**Revenue Cycle**
: The administrative and clinical processes involved in capturing, managing, and collecting patient service revenue—from scheduling through final payment.

**ROS (Review of Systems)**
: A systematic inventory of symptoms organized by body system, used in clinical documentation.

**RVU (Relative Value Unit)**
: A measure of the resources required to provide a medical service. Medicare payment equals RVU × conversion factor.

**RxNorm**
: A normalized naming system for medications maintained by the National Library of Medicine. Provides unique identifiers for drugs at various levels of specificity.

---

## S

**SCRIPT**
: An NCPDP standard for electronic prescribing, enabling prescription transmission from prescribers to pharmacies.

**SNOMED CT (Systematized Nomenclature of Medicine – Clinical Terms)**
: A comprehensive clinical terminology system providing standardized codes for clinical concepts. Used for interoperability and clinical documentation.

**SOAP Note**
: A documentation format with four sections: Subjective (patient symptoms), Objective (exam findings), Assessment (diagnoses), Plan (treatment).

**Standard Concept**
: In OMOP vocabularies, a concept designated as the preferred representation for a clinical meaning. Source codes map to standard concepts.

---

## T

**Terminology**
: A structured vocabulary for clinical concepts, including code systems (ICD-10, CPT, LOINC, SNOMED CT, RxNorm) and their relationships.

**Transition of Care**
: The movement of a patient between healthcare settings (e.g., hospital to home) or providers. A high-risk period requiring careful communication.

**TSH (Thyroid Stimulating Hormone)**
: A blood test measuring thyroid function. Abnormal TSH can indicate hyperthyroidism, a reversible cause of AFib. Maria's TSH of 1.8 is normal.

---

## U

**UCUM (Unified Code for Units of Measure)**
: A standard for representing units of measurement in healthcare (e.g., mg/dL, mmHg, /min).

**UDS (Uniform Data System)**
: A reporting requirement for Federally Qualified Health Centers, including patient demographics, services, and outcomes.

---

## V

**Value Set**
: A collection of codes from one or more terminology systems that represent a clinical concept for quality measurement or research.

**Visit Occurrence**
: An OMOP CDM table that stores encounters/visits, including visit_concept_id (visit type) and visit_start_date.

**Vital Signs**
: Measurements of basic body functions, including blood pressure, heart rate, temperature, respiratory rate, and oxygen saturation.

**Vocabulary**
: A collection of concepts and their relationships used to standardize clinical terminology. In OMOP, vocabularies include SNOMED CT, ICD-10, LOINC, RxNorm, and others.

---

## W

**Workflow**
: The sequence of steps and decisions in a clinical or administrative process. Clinical informatics focuses on optimizing workflows through technology.

---

## X

**X12**
: A standard for electronic data interchange (EDI) in healthcare, including eligibility verification (270/271) and claims submission (837).

---

<div style="page-break-after: always;"></div>

---

# Index

*Note: Page numbers refer to section locations in the digital version. Use your reader's search function (Ctrl+F or Cmd+F) to locate specific terms.*

## A
- ADT messages, Ch. 1, Ch. 9
- Alert fatigue, Ch. 5, Ch. 6
- Anticoagulation, Ch. 2, Ch. 5, Ch. 6
- Apixaban, Ch. 5
- Atrial fibrillation, Ch. 2, Ch. 6, Ch. 10

## B
- Billing codes, Ch. 8
- Blood pressure control, Ch. 7

## C
- C-CDA, Ch. 4, Ch. 9
- Care coordination, Ch. 4
- CDS Hooks, Ch. 6
- CHA₂DS₂-VASc score, Ch. 2, Ch. 6
- Clinical decision support, Ch. 6
- CPOE, Ch. 3
- CPT codes, Ch. 8

## D
- Diabetes management, Ch. 2, Ch. 7
- Discharge summary, Ch. 9
- Drug interactions, Ch. 5

## E
- EHR data population, Ch. 1, Ch. 2, Ch. 3
- Eligibility verification, Ch. 1

## F
- FHIR resources, Ch. 1, Ch. 2, Ch. 3, Appendix B

## H
- HAS-BLED score, Ch. 6
- HEDIS measures, Ch. 7
- HL7 messaging, Ch. 1, Ch. 3

## I
- ICD-10-CM, Ch. 2, Ch. 8, Appendix A

## L
- Laboratory orders, Ch. 3
- LOINC codes, Ch. 2, Ch. 3, Appendix A

## M
- Master Patient Index, Ch. 1
- Medication reconciliation, Ch. 5, Ch. 9
- Metoprolol, Ch. 5

## O
- OHDSI, Ch. 10
- OMOP CDM, Ch. 1, Ch. 2, Ch. 3, Appendix C

## P
- Patient registration, Ch. 1
- Patient-level prediction, Ch. 10
- Phenotyping, Ch. 1, Ch. 2
- Population health, Ch. 7

## Q
- Quality measurement, Ch. 7

## R
- Rate control, Ch. 5
- Readmission prediction, Ch. 10
- Referrals, Ch. 4
- Revenue cycle, Ch. 8
- RxNorm, Ch. 5, Appendix A

## S
- SNOMED CT, Ch. 2, Appendix A
- SOAP notes, Ch. 2
- Stroke risk, Ch. 6

## T
- Transitions of care, Ch. 9

## V
- Vital signs, Ch. 2
- Vocabulary mapping, Ch. 2, Ch. 3

---

<div style="page-break-after: always;"></div>

---

# About the Author

<div align="center">

## Clinical AI Insider

</div>

---

**Clinical AI Insider** writes about the intersection of healthcare and artificial intelligence. With expertise spanning clinical data science, healthcare informatics, and observational health research, the author focuses on bridging the gap between clinical practice and healthcare technology.

### Areas of Expertise

- **OMOP CDM & OHDSI**: ETL pipeline development, vocabulary mapping, and cohort definition
- **Clinical NLP**: Natural language processing for clinical text using transformer models
- **Healthcare Interoperability**: HL7 FHIR, C-CDA, and medical terminology standards
- **Machine Learning in Healthcare**: Predictive modeling for clinical decision support

### Teaching Philosophy

> "Healthcare data should serve patients, not burden clinicians. Every concept_id, every LOINC code, every FHIR resource represents a real patient receiving real care. When we teach informatics, we must never lose sight of the human stories behind the data."

---

<div align="center">

*This textbook is dedicated to the millions of patients*
*whose health journeys generate the data that enables better care for all.*

---

**Blog:** datagodzilla.github.io

</div>

---

## End of Textbook

---

