SELECT 
    s.id AS student_id,
    COUNT(a.id) AS graded_assignments
FROM 
    assignments a
    JOIN students s ON a.student_id = s.id
WHERE 
    a.state = 'GRADED'
GROUP BY 
    s.id;