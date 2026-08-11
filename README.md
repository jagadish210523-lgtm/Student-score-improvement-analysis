## Requirements

- Consider only enrollments with a `completed` status.
- Compare each student's current score with their previous completed score.
- Calculate the score improvement.
- Return only records where the improvement is greater than 0.
- Sort results by improvement in descending order.

## Approach

1. Create a CTE to prepare the student score history.
2. Use `LAG()` to retrieve the previous score for each student.
3. Use `PARTITION BY student_id` to keep each student's records separate.
4. Use `ORDER BY enrollment_id` to establish the order of completed enrollments.
5. Calculate improvement using the current score minus the previous score.
6. Filter results to include only positive improvements.
7. Sort the results from the highest improvement to the lowest.

## SQL Concepts

- Common Table Expressions (CTEs)
- Window Functions
- `LAG()`
- `PARTITION BY`
- `ORDER BY`
- Filtering
- Calculated Columns
- Analytical SQL
