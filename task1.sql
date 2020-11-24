-- 1
SELECT * FROM teacher;

-- 2
SELECT DISTINCT * FROM  studentGroup
WHERE Specialty IN ('ЭВМ');

-- 3
SELECT DISTINCT PersonalNumber, AudienceNumber 
FROM tacherTeachingSubjectsInGroups
WHERE SubjectCodeNumber IN ('18П'); 

-- 4 
SELECT subjects.SubjectCodeNumber, subjects.SubjectName
FROM subjects
JOIN tacherTeachingSubjectsInGroups ON tacherTeachingSubjectsInGroups.SubjectCodeNumber = subjects.SubjectCodeNumber
JOIN teacher ON teacher.PersonalNumber = tacherTeachingSubjectsInGroups.PersonalNumber
WHERE teacher.Surname IN ('Костин');

-- 5
SELECT tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
FROM tacherTeachingSubjectsInGroups
JOIN teacher ON teacher.PersonalNumber = tacherTeachingSubjectsInGroups.PersonalNumber
WHERE teacher.Surname IN ('Фролов');

-- 6
SELECT * FROM  subjects
WHERE Specialty IN ('АСОИ');

-- 7
SELECT * FROM  teacher
WHERE Specialty LIKE ('%АСОИ%');

-- 8
SELECT teacher.Surname
FROM teacher
JOIN tacherTeachingSubjectsInGroups ON tacherTeachingSubjectsInGroups.PersonalNumber = teacher.PersonalNumber
WHERE tacherTeachingSubjectsInGroups.AudienceNumber IN ('210');

-- 9
SELECT subjects.SubjectName, studentGroup.GroupName
FROM tacherTeachingSubjectsInGroups
JOIN subjects ON tacherTeachingSubjectsInGroups.SubjectCodeNumber = subjects.SubjectCodeNumber
JOIN studentGroup ON tacherTeachingSubjectsInGroups.StudentGroupCodeNumber = studentGroup.StudentGroupCodeNumber
WHERE tacherTeachingSubjectsInGroups.AudienceNumber BETWEEN 100 AND 200;

-- 10
SELECT a.StudentGroupCodeNumber AS StudentGroupCodeNumber_1, b.StudentGroupCodeNumber AS StudentGroupCodeNumber_2
FROM studentGroup a, studentGroup b WHERE a.GroupName > b.GroupName
AND a.Specialty = b.Specialty;

-- 11
SELECT SUM(NumberOfPersons) FROM studentGroup
WHERE Specialty IN ('ЭВМ');

-- 12
SELECT teacher.PersonalNumber
FROM teacher
WHERE Specialty LIKE ('%ЭВМ%');

-- 13 
SELECT DISTINCT StudentGroupCodeNumber FROM tacherTeachingSubjectsInGroups;

-- 14
SELECT Surname FROM teacher t
JOIN tacherTeachingSubjectsInGroups tg ON t.PersonalNumber = tg.PersonalNumber
WHERE SubjectCodeNumber IN (
	SELECT SubjectCodeNumber FROM tacherTeachingSubjectsInGroups
	WHERE PersonalNumber IN (
	    SELECT PersonalNumber FROM tacherTeachingSubjectsInGroups
	    WHERE SubjectCodeNumber = '14П'
	)
);

-- 15 
SELECT subjects.* 
FROM subjects
JOIN tacherTeachingSubjectsInGroups ON subjects.SubjectCodeNumber = tacherTeachingSubjectsInGroups.SubjectCodeNumber
WHERE tacherTeachingSubjectsInGroups.PersonalNumber  NOT IN ('221Л');

-- 16
SELECT subjects.* 
FROM subjects
JOIN tacherTeachingSubjectsInGroups ON subjects.SubjectCodeNumber = tacherTeachingSubjectsInGroups.SubjectCodeNumber
JOIN studentGroup ON tacherTeachingSubjectsInGroups.StudentGroupCodeNumber = studentGroup.StudentGroupCodeNumber
WHERE studentGroup.GroupName NOT IN ('М-6');

-- 17
SELECT teacher.*
FROM teacher
JOIN tacherTeachingSubjectsInGroups ON teacher.PersonalNumber = tacherTeachingSubjectsInGroups.PersonalNumber
WHERE (tacherTeachingSubjectsInGroups.StudentGroupCodeNumber='3Г' OR tacherTeachingSubjectsInGroups.StudentGroupCodeNumber='8Г') AND teacher.Position = 'Доцент';

-- 18
SELECT tacherTeachingSubjectsInGroups.SubjectCodeNumber, tacherTeachingSubjectsInGroups.PersonalNumber, tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
FROM tacherTeachingSubjectsInGroups
JOIN teacher ON tacherTeachingSubjectsInGroups.PersonalNumber = teacher.PersonalNumber
WHERE teacher.Department='ЭВМ' AND teacher.Specialty = '%АСОИ%';

-- 19
SELECT studentGroup.StudentGroupCodeNumber
FROM studentGroup
JOIN tacherTeachingSubjectsInGroups ON studentGroup.StudentGroupCodeNumber = tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
JOIN teacher ON tacherTeachingSubjectsInGroups.PersonalNumber = teacher.PersonalNumber
WHERE teacher.Specialty LIKE studentGroup.Specialty;

-- 20
SELECT teacher.PersonalNumber
FROM teacher
JOIN tacherTeachingSubjectsInGroups ON teacher.PersonalNumber = tacherTeachingSubjectsInGroups.PersonalNumber
JOIN studentGroup ON tacherTeachingSubjectsInGroups.StudentGroupCodeNumber = studentGroup.StudentGroupCodeNumber
WHERE studentGroup.Specialty=teacher.Specialty AND teacher.Department='ЭВМ';

-- 21
SELECT studentGroup.Specialty
FROM studentGroup
JOIN tacherTeachingSubjectsInGroups ON studentGroup.StudentGroupCodeNumber = tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
JOIN teacher ON tacherTeachingSubjectsInGroups.PersonalNumber = teacher.PersonalNumber
WHERE teacher.Department='АСУ';

-- 22
SELECT subjects.SubjectCodeNumber
FROM subjects
JOIN tacherTeachingSubjectsInGroups ON subjects.SubjectCodeNumber = tacherTeachingSubjectsInGroups.SubjectCodeNumber
JOIN studentGroup ON tacherTeachingSubjectsInGroups.StudentGroupCodeNumber = studentGroup.StudentGroupCodeNumber
WHERE studentGroup.GroupName='АС-8';

-- 23
SELECT tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
FROM tacherTeachingSubjectsInGroups
WHERE tacherTeachingSubjectsInGroups.SubjectCodeNumber IN (
	SELECT tacherTeachingSubjectsInGroups.SubjectCodeNumber
	FROM tacherTeachingSubjectsInGroups
	JOIN studentGroup ON tacherTeachingSubjectsInGroups.StudentGroupCodeNumber = studentGroup.StudentGroupCodeNumber
	WHERE studentGroup.GroupName='АС-8');

-- 24  //
SELECT DISTINCT studentGroup.StudentGroupCodeNumber
FROM studentGroup
WHERE NOT studentGroup.StudentGroupCodeNumber IN (
  SELECT DISTINCT tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
  FROM tacherTeachingSubjectsInGroups
  WHERE tacherTeachingSubjectsInGroups.SubjectCodeNumber IN (
    SELECT DISTINCT tacherTeachingSubjectsInGroups.SubjectCodeNumber
    FROM tacherTeachingSubjectsInGroups
    JOIN studentGroup
	ON studentGroup.StudentGroupCodeNumber = tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
    WHERE studentGroup.GroupName = 'АС-8'
  )
);

-- 25
SELECT DISTINCT studentGroup.StudentGroupCodeNumber
FROM studentGroup
WHERE NOT studentGroup.StudentGroupCodeNumber IN (
  SELECT DISTINCT tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
  FROM tacherTeachingSubjectsInGroups
  WHERE tacherTeachingSubjectsInGroups.SubjectCodeNumber IN (
    SELECT DISTINCT tacherTeachingSubjectsInGroups.SubjectCodeNumber
    FROM tacherTeachingSubjectsInGroups
    JOIN teacher
	ON teacher.PersonalNumber = tacherTeachingSubjectsInGroups.PersonalNumber
    WHERE teacher.PersonalNumber = '430Л'
  )
);

-- 26
SELECT DISTINCT tacherTeachingSubjectsInGroups.PersonalNumber FROM tacherTeachingSubjectsInGroups
INNER JOIN studentGroup ON studentGroup.StudentGroupCodeNumber = tacherTeachingSubjectsInGroups.StudentGroupCodeNumber
WHERE studentGroup.GroupName = 'Э-15' AND  tacherTeachingSubjectsInGroups.PersonalNumber  NOT IN (
  SELECT tacherTeachingSubjectsInGroups.PersonalNumber FROM tacherTeachingSubjectsInGroups WHERE tacherTeachingSubjectsInGroups.StudentGroupCodeNumber = '12П');