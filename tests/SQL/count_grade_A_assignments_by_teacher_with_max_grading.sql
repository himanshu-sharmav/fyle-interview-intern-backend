WITH TeacherGrades AS (
  SELECT
    teacher_id,
    COUNT(*) AS total_assignments,
    SUM(CASE WHEN grade = 'A' THEN 1 ELSE 0 END) AS grade_a_count
  FROM
    assignments
  WHERE
    grade IS NOT NULL
  GROUP BY
    teacher_id
),
MaxGradedTeacher AS (
  SELECT
    teacher_id
  FROM
    TeacherGrades
  ORDER BY
    total_assignments DESC
  LIMIT 1
)
SELECT
  TG.teacher_id,
  TG.grade_a_count
FROM
  TeacherGrades TG
JOIN
  MaxGradedTeacher MGT ON TG.teacher_id = MGT.teacher_id;