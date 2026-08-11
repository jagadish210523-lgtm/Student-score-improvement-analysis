WITH student_improvement AS (
    SELECT
        s.name AS student_name,
        c.title AS course_title,
        LAG(e.score) OVER(PARTITION BY e.student_id ORDER BY e.id) AS previous_score,
        e.score AS current_score
    FROM enrollments AS e
    LEFT JOIN students AS s
    ON s.id = e.student_id
    LEFT JOIN courses AS c
    ON c.id = e.course_id
    WHERE e.status = 'completed'
)
SELECT *,
    current_score - previous_score AS improvement
FROM student_improvement
WHERE current_score - previous_score > 0
ORDER BY current_score - previous_score DESC;