Skip to main content
Stanford University
Stanford Lagunita Home Page
Databases: DB5 SQLDashboard for:rraj411
More optionsHelp
Course, current location 
Discussion
 
Wiki
 
Progress
 
Readings
 
Software Guide
Course  SQL  SQL Social-Network Query Exercises  SQL Social-Network Query Exercises
 Previous

problem SQL Social-Network Query Exercises Next 
 Bookmark this page
Students at your hometown high school have decided to organize their social network using databases. So far, they have collected information about sixteen students in four grades, 9-12. Here's the schema:

Highschooler ( ID, name, grade )
English: There is a high school student with unique ID and a given first name in a certain grade.

Friend ( ID1, ID2 )
English: The student with ID1 is friends with the student with ID2. Friendship is mutual, so if (123, 456) is in the Friend table, so is (456, 123).

Likes ( ID1, ID2 )
English: The student with ID1 likes the student with ID2. Liking someone is not necessarily mutual, so if (123, 456) is in the Likes table, there is no guarantee that (456, 123) is also present.

Your queries will run over a small data set conforming to the schema. View the database. (You can also download the schema and data.)

For your convenience, here is a graph showing the various connections between the students in our database. 9th graders are blue, 10th graders are green, 11th graders are yellow, and 12th graders are purple. Undirected black edges indicate friendships, and directed red edges indicate that one student likes another student.

Social graph


Instructions: Each problem asks you to write a query in SQL. To run your query against our back-end sample database using SQLite, click the "Submit" button. You will see a display of your query result and the expected result. If the results match, your query will be marked "correct". You may run as many queries as you like for each question.

Important Notes:

Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Unless a specific result ordering is asked for, you can return the result rows in any order.
You are to translate the English into a SQL query that computes the desired result over all possible databases. All we actually check is that your query gets the right answer on the small sample database. Thus, even if your solution is marked as correct, it is possible that your query does not correctly reflect the problem at hand. (For example, if we ask for a complex condition that requires accessing all of the tables, but over our small data set in the end the condition is satisfied only by Star Wars, then the query "select title from Movie where title = 'Star Wars'" will be marked correct even though it doesn't reflect the actual question.) Circumventing the system in this fashion will get you a high score on the exercises, but it won't help you learn SQL. On the other hand, an incorrect attempt at a general solution is unlikely to produce the right answer, so you shouldn't be led astray by our checking system.

You may perform these exercises as many times as you like, so we strongly encourage you to keep working with them until you complete the exercises with full credit.

Q1
0.0/1.0 point (graded)
Find the names of all students who are friends with someone named Gabriel.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q2
0.0/1.0 point (graded)
For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q3
0.0/1.0 point (graded)
For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q4
0.0/1.0 point (graded)
Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q5
0.0/1.0 point (graded)
For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q6
0.0/1.0 point (graded)
Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q7
0.0/1.0 point (graded)
For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q8
0.0/1.0 point (graded)
Find the difference between the number of students in the school and the number of different first names.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
Q9
0.0/1.0 point (graded)
Find the name and grade of all students who are liked by more than one other student.

Note: Your queries are executed using SQLite, so you must conform to the SQL constructs supported by SQLite.
Code Editor
1
Enter your SQL query here
Press ESC then TAB or click outside of the code editor to exit
unansweredUnanswered
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.
 Previous
Next 
© All Rights Reserved
AboutHelp CenterContact
organization logo

Stanford University pursues the science of learning. Online learners are important participants in that pursuit. The information we gather from your engagement with our instructional offerings makes it possible for faculty, researchers, designers and engineers to continuously improve their work and, in that process, build learning science.
Terms of Service & Honor Code Privacy Policy Take more courses at online.stanford.edu
Powered by Open edX
Stanford UniversityStanford Home Maps & Directions Search Stanford Emergency InfoTerms of Use Privacy Copyright Trademarks Non-Discrimination Accessibility
© Stanford University. Stanford, California 94305.

