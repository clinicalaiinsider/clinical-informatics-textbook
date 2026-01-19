# Contributing to Clinical Informatics Textbook

Thank you for your interest in contributing to the Clinical Informatics Textbook! This document provides guidelines for contributing to the project.

## Ways to Contribute

### 1. Report Issues
- Found a bug in the SQL queries?
- Noticed an error in the clinical content?
- Have suggestions for improvement?

Please open an issue with:
- A clear, descriptive title
- Detailed description of the issue
- Steps to reproduce (if applicable)
- Expected vs actual behavior

### 2. Improve Documentation
- Fix typos or grammatical errors
- Clarify confusing explanations
- Add examples or diagrams
- Translate content

### 3. Add New Content
- Additional example queries
- New patient scenarios
- Extended clinical narratives
- Quality measure calculations

### 4. Technical Contributions
- Data quality validation scripts
- Python/R analysis examples
- Automated testing
- CI/CD improvements

## Getting Started

### Fork and Clone
```bash
git clone https://github.com/yourusername/clinical-informatics-textbook.git
cd clinical-informatics-textbook
```

### Set Up Your Environment
1. Install PostgreSQL 15+
2. Set up OMOP CDM schema (or use OHDSI-in-a-Box)
3. Load the teaching dataset
4. Verify queries run successfully

### Create a Branch
```bash
git checkout -b feature/your-feature-name
```

## Contribution Guidelines

### For SQL Queries
- Use consistent formatting (uppercase keywords, proper indentation)
- Include comments explaining the clinical context
- Test queries against the teaching dataset
- Document expected results

### For Documentation
- Follow the existing writing style (clinical educator voice)
- Use markdown formatting consistently
- Include clinical context and explanations
- Add references where appropriate

### For Clinical Content
- Ensure medical accuracy
- Use standard terminology (SNOMED CT, LOINC, etc.)
- Reference clinical guidelines when applicable
- Include appropriate disclaimers

### For Data Files
- Maintain CSV format consistency
- Update data dictionary for new columns
- Ensure referential integrity
- Document data sources

## Code of Conduct

### Be Respectful
- Treat all contributors with respect
- Welcome newcomers and help them learn
- Accept constructive criticism gracefully

### Be Inclusive
- Use inclusive language
- Consider accessibility in contributions
- Value diverse perspectives

### Be Professional
- Focus on the work, not individuals
- Maintain confidentiality of any PHI discussions
- Follow healthcare data handling best practices

## Pull Request Process

1. **Update Documentation**: Ensure README and relevant docs are updated
2. **Test Your Changes**: Run queries, validate data integrity
3. **Write Clear Commit Messages**: Describe what and why
4. **Submit PR**: Use the pull request template
5. **Respond to Feedback**: Address review comments promptly

### PR Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Data update

## Testing
- [ ] SQL queries tested
- [ ] Data integrity verified
- [ ] Documentation reviewed

## Related Issues
Closes #XX
```

## Style Guide

### SQL Formatting
```sql
-- Good
SELECT
    p.person_id,
    p.person_source_value AS mrn,
    EXTRACT(YEAR FROM CURRENT_DATE) - p.year_of_birth AS age
FROM cdm.person p
WHERE p.person_id = 12345;

-- Avoid
select p.person_id, p.person_source_value as mrn, extract(year from current_date) - p.year_of_birth as age from cdm.person p where p.person_id = 12345;
```

### Markdown Formatting
- Use ATX-style headers (`#`, `##`, `###`)
- One sentence per line for easier diffs
- Use fenced code blocks with language identifiers
- Include alt text for images

### Clinical Writing
- Define acronyms on first use
- Use standard medical terminology
- Include clinical context for technical concepts
- Write as a clinical educator, not a software manual

## Questions?

- Open a Discussion for general questions
- Open an Issue for specific problems
- Reach out to maintainers for guidance

## Recognition

Contributors will be recognized in:
- README acknowledgments
- Release notes
- (Future) Contributors page

Thank you for helping improve clinical informatics education!
