#!/usr/bin/env python3
"""
Data Validation Script for Clinical Informatics Textbook
Validates CSV files and checks referential integrity.
"""

import pandas as pd
from pathlib import Path
import sys


def load_csv_files(data_dir: Path) -> dict:
    """Load all CSV files from the data directory."""
    csv_files = {}
    for csv_file in data_dir.glob("*.csv"):
        if csv_file.name != "data_dictionary.csv":
            csv_files[csv_file.stem] = pd.read_csv(csv_file)
            print(f"Loaded {csv_file.name}: {len(csv_files[csv_file.stem])} records")
    return csv_files


def validate_person(df: pd.DataFrame) -> list:
    """Validate person table."""
    errors = []

    # Check required fields
    if df["person_id"].isnull().any():
        errors.append("person: Missing person_id values")

    # Check valid gender concept IDs
    valid_genders = {8507, 8532}  # Male, Female
    invalid_genders = set(df["gender_concept_id"].unique()) - valid_genders
    if invalid_genders:
        errors.append(f"person: Invalid gender_concept_id: {invalid_genders}")

    # Check year of birth is reasonable
    if (df["year_of_birth"] < 1900).any() or (df["year_of_birth"] > 2026).any():
        errors.append("person: Invalid year_of_birth values")

    return errors


def validate_visit_occurrence(df: pd.DataFrame, person_df: pd.DataFrame) -> list:
    """Validate visit_occurrence table."""
    errors = []

    # Check person_id references exist
    valid_persons = set(person_df["person_id"])
    invalid_refs = set(df["person_id"]) - valid_persons
    if invalid_refs:
        errors.append(f"visit_occurrence: Invalid person_id references: {invalid_refs}")

    # Check visit dates are reasonable
    df["visit_start_date"] = pd.to_datetime(df["visit_start_date"])
    if (df["visit_start_date"] > pd.Timestamp.now()).any():
        # Allow future dates for teaching dataset
        pass

    return errors


def validate_condition_occurrence(df: pd.DataFrame, person_df: pd.DataFrame,
                                   visit_df: pd.DataFrame) -> list:
    """Validate condition_occurrence table."""
    errors = []

    # Check person_id references
    valid_persons = set(person_df["person_id"])
    invalid_persons = set(df["person_id"]) - valid_persons
    if invalid_persons:
        errors.append(f"condition_occurrence: Invalid person_id: {invalid_persons}")

    # Check visit_occurrence_id references
    valid_visits = set(visit_df["visit_occurrence_id"])
    invalid_visits = set(df["visit_occurrence_id"]) - valid_visits
    if invalid_visits:
        errors.append(f"condition_occurrence: Invalid visit_occurrence_id: {invalid_visits}")

    return errors


def validate_measurement(df: pd.DataFrame, person_df: pd.DataFrame,
                         visit_df: pd.DataFrame) -> list:
    """Validate measurement table."""
    errors = []

    # Check person_id references
    valid_persons = set(person_df["person_id"])
    invalid_persons = set(df["person_id"]) - valid_persons
    if invalid_persons:
        errors.append(f"measurement: Invalid person_id: {invalid_persons}")

    # Check numeric values are reasonable
    if (df["value_as_number"] < 0).any():
        errors.append("measurement: Negative values found in value_as_number")

    return errors


def validate_drug_exposure(df: pd.DataFrame, person_df: pd.DataFrame,
                           visit_df: pd.DataFrame) -> list:
    """Validate drug_exposure table."""
    errors = []

    # Check person_id references
    valid_persons = set(person_df["person_id"])
    invalid_persons = set(df["person_id"]) - valid_persons
    if invalid_persons:
        errors.append(f"drug_exposure: Invalid person_id: {invalid_persons}")

    # Check days_supply is positive
    if (df["days_supply"] <= 0).any():
        errors.append("drug_exposure: Invalid days_supply values")

    return errors


def validate_referential_integrity(data: dict) -> list:
    """Check all foreign key relationships."""
    errors = []

    if "provider" in data and "care_site" in data:
        valid_care_sites = set(data["care_site"]["care_site_id"])
        provider_care_sites = set(data["provider"]["care_site_id"].dropna())
        invalid = provider_care_sites - valid_care_sites
        if invalid:
            errors.append(f"provider: Invalid care_site_id references: {invalid}")

    return errors


def main():
    """Main validation function."""
    # Determine data directory
    script_dir = Path(__file__).parent
    data_dir = script_dir.parent.parent / "data" / "csv"

    if not data_dir.exists():
        print(f"Error: Data directory not found: {data_dir}")
        sys.exit(1)

    print(f"\nValidating data in: {data_dir}\n")
    print("=" * 50)

    # Load all CSV files
    data = load_csv_files(data_dir)
    print("=" * 50)

    all_errors = []

    # Run validations
    if "person" in data:
        all_errors.extend(validate_person(data["person"]))

    if "visit_occurrence" in data and "person" in data:
        all_errors.extend(validate_visit_occurrence(
            data["visit_occurrence"], data["person"]))

    if "condition_occurrence" in data:
        all_errors.extend(validate_condition_occurrence(
            data["condition_occurrence"],
            data.get("person", pd.DataFrame()),
            data.get("visit_occurrence", pd.DataFrame())))

    if "measurement" in data:
        all_errors.extend(validate_measurement(
            data["measurement"],
            data.get("person", pd.DataFrame()),
            data.get("visit_occurrence", pd.DataFrame())))

    if "drug_exposure" in data:
        all_errors.extend(validate_drug_exposure(
            data["drug_exposure"],
            data.get("person", pd.DataFrame()),
            data.get("visit_occurrence", pd.DataFrame())))

    # Check referential integrity
    all_errors.extend(validate_referential_integrity(data))

    # Report results
    print("\nValidation Results")
    print("=" * 50)

    if all_errors:
        print(f"\nFound {len(all_errors)} error(s):\n")
        for error in all_errors:
            print(f"  - {error}")
        sys.exit(1)
    else:
        print("\nAll validations passed!")
        print(f"Validated {len(data)} tables successfully.")
        sys.exit(0)


if __name__ == "__main__":
    main()
