#!/bin/bash

# CSV Data Filtering and Sorting Task Solution
# Read employees.csv, filter Engineering department, transform data, sort by salary

python3 -c "
import csv
import sys

# Read input CSV
employees = []
with open('/app/employees.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        employees.append(row)

# Filter for Engineering department
engineering_employees = [emp for emp in employees if emp['department'] == 'Engineering']

# Transform data
transformed_data = []
for emp in engineering_employees:
    years_exp = int(emp['years_experience'])
    if years_exp < 5:
        level = 'junior'
    elif years_exp <= 8:
        level = 'mid'
    else:
        level = 'senior'

    transformed_data.append({
        'name': emp['name'],
        'salary': int(emp['salary']),
        'experience_level': level
    })

# Sort by salary descending
transformed_data.sort(key=lambda x: x['salary'], reverse=True)

# Write output CSV
with open('/app/output.csv', 'w', newline='') as f:
    if transformed_data:
        writer = csv.DictWriter(f, fieldnames=['name', 'salary', 'experience_level'])
        writer.writeheader()
        for row in transformed_data:
            writer.writerow(row)
"