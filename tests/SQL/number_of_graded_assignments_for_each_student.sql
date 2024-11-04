-- Write query to get number of graded assignments for each student:
SELECT
student_id,
count(*) as graded_assignments_count
FROM assignments
WHERE assignments.state = 'GRADED'
GROUP BY student_id;