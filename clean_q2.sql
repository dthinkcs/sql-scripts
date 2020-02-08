Q1
0.0/1.0 point (graded)
Find the names of all students who are friends with someone named Gabriel.
SELECT H2.name
FROM Friend INNER JOIN Highschooler H1 ON Friend.ID1 = H1.ID INNER JOIN Highschooler H2 ON Friend.ID2 = H2.ID
WHERE H1.name='Gabriel'

Q2
-- 0.0/1.0 point (graded)
-- For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, 
-- and the name and grade of the student they like.
-- ID1-likes->ID2
SELECT H1.name, H1.grade, H2.name, H2.grade
FROM Likes INNER JOIN Highschooler H1 ON Likes.ID1 = H1.ID INNER JOIN Highschooler H2 ON Likes.ID2 = H2.ID
WHERE H1.grade - H2.grade >= 2

Q3
-- 0.0/1.0 point (graded)
-- For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order.
SELECT *
FROM Likes L1 JOIN Likes L2 ON L1.ID1 = L2.ID2 AND L1.ID2 = L2.ID1

SELECT H1.name, H1.grade, H2.name, H2.grade
FROM Likes L1 JOIN Likes L2 ON L1.ID1 = L2.ID2 AND L1.ID2 = L2.ID1 
JOIN Highschooler H1 ON H1.ID=L1.ID1 
JOIN Highschooler H2 ON H2.ID=L1.ID2
WHERE H1.name < H2.name


Q4
0.0/1.0 point (graded)
-- Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade.
SELECT name, grade 
FROM Highschooler 
WHERE ID NOT IN ( select id1 from likes ) AND ID NOT IN ( select id2 from likes )
ORDER BY grade, name

Q5
0.0/1.0 point (graded)
-- For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades.
SELECT H1.name, H1.grade, H2.name, H2.grade
FROM Likes L
JOIN Highschooler H1 ON H1.ID=L.ID1 
JOIN Highschooler H2 ON H2.ID=L.ID2
WHERE ID2 NOT IN ( select ID1 from Likes )

Q6
0.0/1.0 point (graded)
-- Find names and grades of students who have friends in the same grade. Return the result sorted by grade, then by name within each grade.
SELECT DISTINCT H1.name, H1.grade
FROM Friend INNER JOIN Highschooler H1 ON Friend.ID1 = H1.ID INNER JOIN Highschooler H2 ON Friend.ID2 = H2.ID
WHERE H1.grade = H2.grade
ORDER BY H1.grade, H1.name
-- Find names and grades of students who have ONLY friends in the same grade. Return the result sorted by grade, then by name within each grade.
SELECT DISTINCT H1.name, H1.grade
FROM Friend INNER JOIN Highschooler H1 ON Friend.ID1 = H1.ID INNER JOIN Highschooler H2 ON Friend.ID2 = H2.ID
WHERE H1.grade = H2.grade AND ID1 NOT IN (
    SELECT ID1
    FROM Friend INNER JOIN Highschooler H1 ON Friend.ID1 = H1.ID INNER JOIN Highschooler H2 ON Friend.ID2 = H2.ID
    WHERE H1.grade != H2.grade
)
ORDER BY H1.grade, H1.name



Q7
0.0/1.0 point (graded)
For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C.
-- FINALLY
SELECT DISTINCT H1.name, H1.grade, H2.name, H2.grade, H3.name, H3.grade
FROM Likes L INNER JOIN Highschooler H1 ON L.ID1 = H1.ID INNER JOIN Highschooler H2 ON L.ID2 = H2.ID
JOIN Friend CF ON L.ID1 = CF.ID1 AND L.ID2 IN ( select FF.ID2 from Friend FF where CF.ID2=FF.ID1 ) JOIN Highschooler H3 ON CF.ID2=H3.ID
WHERE L.ID2 NOT IN (
    SELECT F.ID2
    FROM Friend F
    WHERE L.ID1=F.ID1
)


Q8
-- 0.0/1.0 point (graded)
-- Find the difference between the number of students in the school and the number of different first names.
SELECT higherCount - lowerCount
FROM (
    SELECT COUNT(id) AS higherCount
    FROM Highschooler
), 
(
    SELECT COUNT(DISTINCT name) AS lowerCount
    FROM Highschooler
)

Q9
-- 0.0/1.0 point (graded)
Find the name and grade of all students who are liked by more than one other student.
SELECT H.name, H.grade 
FROM Likes L JOIN Highschooler H ON H.ID=L.ID2
GROUP BY L.ID2
HAVING COUNT(*) >= 2


INSERT INTO FRIEND
SELECT F1.ID1, F2.ID2
FROM FRIEND F1 JOIN FRIEND F2 ON F1.ID2 = F2.ID1
WHERE F1.ID1 != F2.ID2
EXCEPT
SELECT * FROM FRIEND