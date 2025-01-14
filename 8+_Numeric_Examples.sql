-- 1
SELECT 
    (A_STRONGLY_AGREE/(A_STRONGLY_DISAGREE + A_DISAGREE + A_NEUTRAL + A_AGREE + A_STRONGLY_AGREE))* 100 AS percentage_strongly_agree
FROM nss
WHERE question = 'Q01'
    AND institution = 'Edinburgh Napier University'
    AND subject = '(8) Computer Science';

-- 2
SELECT institution, subject
    FROM nss
WHERE question='Q15'
    AND score >= 100;

-- 3
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < 50;

-- 4
SELECT 
    subject,
    SUM(response) AS total_students_responded
FROM nss
WHERE question = 'Q22'
    AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;


-- 5
SELECT 
    subject,
    SUM((response*A_STRONGLY_AGREE)/100) AS total_strongly_agree
FROM nss
WHERE question = 'Q22'
    AND subject IN ('(8) Computer Science', '(H) Creative Arts and Design')
GROUP BY subject;

-- 6
SELECT subject, ROUND(SUM(A_STRONGLY_AGREE * response)/SUM(response))
FROM nss
WHERE question='Q22' 
AND subject in('(8) Computer Science','(H) Creative Arts and Design')
GROUP BY subject;

-- 7
SELECT institution, ROUND(SUM(score * response) / SUM(response)) AS percentage
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution;

-- 8
SELECT institution,SUM(sample), SUM(CASE WHEN subject LIKE '%Computer Science%' THEN sample ELSE 0 END) AS computing_students
  FROM nss
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
GROUP BY institution;

-- 9
