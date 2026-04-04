# CSV Data Filtering and Sorting Task

## Objective

Read a CSV file containing employee data, filter and sort it according to specifications, and write the result to an output file.

## Input

The file `/app/employees.csv` contains employee data with the following columns:
- `id`: Employee ID (integer)
- `name`: Employee full name (string)
- `department`: Department name (string)
- `salary`: Annual salary (integer)
- `years_experience`: Years of experience (integer)

Example input data:
```csv
id,name,department,salary,years_experience
1,John Doe,Engineering,75000,5
2,Jane Smith,Marketing,65000,3
3,Bob Johnson,Engineering,80000,8
4,Alice Brown,Sales,55000,2
5,Charlie Wilson,Engineering,90000,10
```

## Task

Transform the input data and write the result to `/app/output.csv` with the following requirements:

1. **Filter**: Only include employees from the "Engineering" department
2. **Transform**: For each employee, keep only these columns:
   - `name`: Employee full name
   - `salary`: Annual salary
   - `experience_level`: Categorize by years of experience:
     - "junior" if years_experience < 5
     - "mid" if years_experience is 5-8
     - "senior" if years_experience > 8
3. **Sort**: Sort the results by `salary` in descending order (highest salary first)

## Output Format

The output file `/app/output.csv` should be a valid CSV file with headers and the filtered/sorted data.

Example output:
```csv
name,salary,experience_level
Charlie Wilson,90000,senior
Bob Johnson,80000,mid
John Doe,75000,mid
```