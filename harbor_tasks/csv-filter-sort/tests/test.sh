#!/bin/bash

# Test script for CSV filtering and sorting task
# This script runs the solution and validates the output

set -e

# Run the solution
/app/solution/solve.sh

# Check if output file exists
if [ ! -f "/app/output.csv" ]; then
    echo "Error: output.csv not found"
    exit 1
fi

# Validate the output using Python
python3 -c "
import csv
import sys

# Read the output
output_data = []
try:
    with open('/app/output.csv', 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            output_data.append(row)
except Exception as e:
    print(f'Error reading output.csv: {e}')
    sys.exit(1)

# Expected results (sorted by salary descending)
expected = [
    {'name': 'Charlie Wilson', 'salary': '90000', 'experience_level': 'senior'},
    {'name': 'Bob Johnson', 'salary': '80000', 'experience_level': 'mid'},
    {'name': 'Grace Lee', 'salary': '78000', 'experience_level': 'mid'},
    {'name': 'John Doe', 'salary': '75000', 'experience_level': 'mid'},
    {'name': 'Eve Adams', 'salary': '70000', 'experience_level': 'junior'}
]

# Check count
if len(output_data) != len(expected):
    print(f'Error: Expected {len(expected)} rows, got {len(output_data)}')
    sys.exit(1)

# Check each row
for i, (actual, exp) in enumerate(zip(output_data, expected)):
    if actual['name'] != exp['name']:
        print(f'Row {i}: Expected name {exp[\"name\"]}, got {actual[\"name\"]}')
        sys.exit(1)
    if actual['salary'] != exp['salary']:
        print(f'Row {i}: Expected salary {exp[\"salary\"]}, got {actual[\"salary\"]}')
        sys.exit(1)
    if actual['experience_level'] != exp['experience_level']:
        print(f'Row {i}: Expected experience_level {exp[\"experience_level\"]}, got {actual[\"experience_level\"]}')
        sys.exit(1)

print('All tests passed!')
"