---
created: 2026-01-19 15:11:29
profile: research-hub
type: research-document
status: draft
---

# Kindle Direct Publishing Guide

## Clinical Informatics: A Provider's Journey Through Healthcare Data

**Author:** Clinical AI Insider
**KDP-Ready File:** `CLINICAL-INFORMATICS-TEXTBOOK-KDP.md`

---

## Changes Made for KDP Compliance

### 1. Author Attribution
- **Changed from:** Jennifer Torres, MSN, RN-BC (fictional)
- **Changed to:** Clinical AI Insider (your real name)

### 2. Publisher References Removed
- Removed "Community Health Clinic Press"
- Removed "Springfield, Illinois" publisher location
- Removed fictional ISBN numbers (KDP assigns these automatically)

### 3. Fictional Narrator Removed
- Original preface was written from perspective of fictional "Jennifer Torres"
- New preface written in third-person educational style
- Removed first-person narrator voice throughout front matter

### 4. Content Disclaimer Retained
- Kept clear disclaimer that all patient names, providers, and organizations are fictional
- This is appropriate and recommended for educational case study books

---

## KDP Metadata Setup

When publishing on KDP, enter the following:

### Title Information
- **Title:** Clinical Informatics: A Provider's Journey Through Healthcare Data
- **Subtitle:** A Comprehensive Guide with Case Studies, Workflows & Technology Solutions
- **Series:** (leave blank or create if publishing multiple volumes)
- **Edition:** First Edition

### Author/Contributors
- **Author:** Clinical AI Insider
- **Contributors:** (leave blank)

### Description (for Amazon listing)
```
Master healthcare informatics through the complete clinical journey of a single patient.

This comprehensive guide bridges two worlds that too often speak past each other: clinical practice and healthcare technology. Follow Maria Rodriguez—a composite fictional patient—from her first phone call to schedule an appointment through diagnosis, treatment, and long-term outcomes.

Each chapter examines:
• Clinical workflows and documentation
• Data architecture and EHR population
• Standards mapping (ICD-10, SNOMED CT, LOINC, RxNorm, CPT)
• OMOP CDM and OHDSI research applications
• FHIR resources and implementation patterns

Perfect for:
• Clinical data scientists seeking clinical context
• Informatics students learning healthcare data flows
• Software engineers entering the healthcare domain
• Healthcare professionals understanding data standards

Includes SQL queries, Python code examples, and visual mindmaps for each chapter.
```

### Categories
**Primary:** Medical > Nursing > Informatics
**Secondary:** Computers > Database Administration & Management

### Keywords (up to 7)
1. clinical informatics
2. OMOP CDM
3. healthcare data
4. FHIR HL7
5. medical terminology
6. OHDSI
7. nursing informatics

---

## File Format Conversion

KDP accepts several formats. For best results:

### Option 1: DOCX (Recommended)
Convert the markdown to DOCX using Pandoc:
```bash
cd docs
pandoc CLINICAL-INFORMATICS-TEXTBOOK-KDP.md -o CLINICAL-INFORMATICS-TEXTBOOK-KDP.docx --resource-path=.:../assets
```

### Option 2: Kindle Create
1. Convert markdown to DOCX first
2. Import into Kindle Create (free Amazon tool)
3. Apply formatting and preview
4. Export as KPF file

### Option 3: EPUB
```bash
cd docs
pandoc CLINICAL-INFORMATICS-TEXTBOOK-KDP.md -o CLINICAL-INFORMATICS-TEXTBOOK-KDP.epub \
  --toc \
  --epub-cover-image=../assets/cover-page.jpg \
  --resource-path=.:../assets
```

**Note:** The `--resource-path` flag ensures Pandoc can locate images using relative paths.

---

## Cover Image Requirements

KDP Cover specifications:
- **Minimum:** 625 x 1000 pixels
- **Ideal:** 1600 x 2560 pixels (1:1.6 aspect ratio)
- **File format:** JPEG or TIFF
- **Color mode:** RGB
- **Maximum file size:** 50 MB

Your cover image is at: `../assets/cover-page.jpg`
- **Current size:** 747 x 1024 pixels (meets minimum, consider upscaling for ideal)

You may need to resize or add spine/back cover for paperback edition.

---

## Pricing Strategy

### eBook Pricing (70% royalty tier)
- **US:** $9.99 - $14.99 (technical books can command higher prices)
- **UK:** £7.99 - £11.99
- Requires price between $2.99-$9.99 for 70% royalty
- Above $9.99 drops to 35% royalty

### Paperback Pricing
- Calculate based on page count and printing costs
- KDP provides printing cost calculator
- Typical technical book: $24.99 - $39.99

---

## Pre-Publication Checklist

- [ ] Convert markdown to DOCX or EPUB
- [ ] Review formatting in Kindle Previewer
- [ ] Verify all internal links work
- [ ] Check code block formatting
- [ ] Ensure tables display correctly
- [ ] Verify images are embedded (not linked)
- [ ] Create high-resolution cover
- [ ] Write compelling book description
- [ ] Select appropriate categories and keywords
- [ ] Set pricing

---

## AI Content Disclosure

Per KDP guidelines, you must disclose if AI was used:
- **AI-Generated Content:** Disclose if AI created text, images, or translations
- **AI-Assisted Content:** No disclosure required (editing, refinement, suggestions)

If Claude or other AI tools were used to help write this book, check the appropriate box during KDP upload.

---

## Links and Resources

- [KDP Publishing Guidelines](https://kdp.amazon.com/en_US/help/topic/GU72M65VRFPH43L6)
- [KDP Metadata Guidelines](https://kdp.amazon.com/en_US/help/topic/G201097560)
- [eBook Formatting Guide](https://kdp.amazon.com/en_US/help/topic/G200645680)
- [Content Quality Guide](https://kdp.amazon.com/en_US/help/topic/G200952510)
- [Kindle Create Download](https://www.amazon.com/Kindle-Create/b?node=18292298011)
- [Kindle Previewer Download](https://www.amazon.com/Kindle-Previewer/b?node=21381691011)

---

## File Locations

| File | Purpose |
|------|---------|
| `CLINICAL-INFORMATICS-TEXTBOOK-KDP.md` | KDP-ready markdown source |
| `CLINICAL-INFORMATICS-TEXTBOOK-ACADEMIC.md` | Original version (with fictional narrator) |
| `../assets/cover-page.jpg` | Cover image |
| `../assets/infographics/` | Chapter diagrams and mindmaps |

---

*Generated: January 2026*
