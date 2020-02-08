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
Course  SQL  SQL Movie-Rating Modification Exercises  SQL Movie-Rating Modification Exercises
 Previous

problem SQL Movie-Rating Modification Exercises Next 
 Bookmark this page
You've started a new movie-rating website, and you've been collecting data on reviewers' ratings of various movies. There's not much data yet, but you can still try out some data modifications. Here's the schema:

Movie ( mID, title, year, director )
English: There is a movie with ID number mID, a title, a release year, and a director.

Reviewer ( rID, name )
English: The reviewer with ID number rID has a certain name.

Rating ( rID, mID, stars, ratingDate )
English: The reviewer rID gave the movie mID a number of stars rating (1-5) on a certain ratingDate.

Your modifications will run over a small data set conforming to the schema. View the database. (You can also download the schema and data.)

Instructions: You are to write each of the following data modification commands using SQL. Our back-end runs each modification using SQLite on the original state of the sample database. It then performs a query over the modified database to check whether your command made the correct modification, and restores the database to its original state. 

You may perform these exercises as many times as you like, so we strongly encourage you to keep working with them until you complete the exercises with full credit.

Q1
1.0/1.0 point (graded)
Add the reviewer Roger Ebert to your database, with an rID of 209.
Code Editor
1
insert into Reviewer values (209, 'Roger Ebert')
Press ESC then TAB or click outside of the code editor to exit
correctCorrect

Correct

To check your data modification statement, we ran the following query after your modification: select * from Reviewer order by rID, name

Your Query Result:
201	Sarah Martinez
202	Daniel Lewis
203	Brittany Harris
204	Mike Anderson
205	Chris Jackson
206	Elizabeth Thomas
207	James Cameron
208	Ashley White
209	Roger Ebert

Expected Query Result:
201	Sarah Martinez
202	Daniel Lewis
203	Brittany Harris
204	Mike Anderson
205	Chris Jackson
206	Elizabeth Thomas
207	James Cameron
208	Ashley White
209	Roger Ebert
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.

ResetReset Your Answer
Q2
1.0/1.0 point (graded)
Insert 5-star ratings by James Cameron for all movies in the database. Leave the review date as NULL.
Code Editor
1
insert into Rating  ( rID, mID, stars, ratingDate )
2
select Reviewer.rID , Movie.mID, 5, null from Movie
3
left outer join Reviewer
4
where Reviewer.name='James Cameron'
5
 
Press ESC then TAB or click outside of the code editor to exit
correctCorrect

Correct

To check your data modification statement, we ran the following query after your modification: select * from Rating where stars = 5 order by rID, mID

Your Query Result:
206	106	5	2011-01-19
207	101	5	<NULL>
207	102	5	<NULL>
207	103	5	<NULL>
207	104	5	<NULL>
207	105	5	<NULL>
207	106	5	<NULL>
207	107	5	<NULL>
207	107	5	2011-01-20
207	108	5	<NULL>

Expected Query Result:
206	106	5	2011-01-19
207	101	5	<NULL>
207	102	5	<NULL>
207	103	5	<NULL>
207	104	5	<NULL>
207	105	5	<NULL>
207	106	5	<NULL>
207	107	5	<NULL>
207	107	5	2011-01-20
207	108	5	<NULL>
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.

ResetReset Your Answer
Q3
1/1 point (graded)
For all movies that have an average rating of 4 stars or higher, add 25 to the release year. (Update the existing tuples; don't insert new tuples.)
Code Editor
update movie
set year = year + 25
where mID in (
  select mID from Rating
  where mID=rating.mID
  group by mID
  having AVG(stars) >=4
)
1
update movie
2
set year = year + 25
3
where mID in (
4
  select mID from Rating
5
  where mID=rating.mID
6
  group by mID
7
  having AVG(stars) >=4
8
)
Press ESC then TAB or click outside of the code editor to exit
correctCorrect

Correct

To check your data modification statement, we ran the following query after your modification: select * from Movie order by mID

Your Query Result:
101	Gone with the Wind	1939	Victor Fleming
102	Star Wars	1977	George Lucas
103	The Sound of Music	1965	Robert Wise
104	E.T.	1982	Steven Spielberg
105	Titanic	1997	James Cameron
106	Snow White	1962	<NULL>
107	Avatar	2034	James Cameron
108	Raiders of the Lost Ark	1981	Steven Spielberg

Expected Query Result:
101	Gone with the Wind	1939	Victor Fleming
102	Star Wars	1977	George Lucas
103	The Sound of Music	1965	Robert Wise
104	E.T.	1982	Steven Spielberg
105	Titanic	1997	James Cameron
106	Snow White	1962	<NULL>
107	Avatar	2034	James Cameron
108	Raiders of the Lost Ark	1981	Steven Spielberg
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.

ResetReset Your Answer
Correct (1/1 point)Review
Q4
1.0/1.0 point (graded)
Remove all ratings where the movie's year is before 1970 or after 2000, and the rating is fewer than 4 stars.
Code Editor
1
delete from rating
2
where mID in (select mID from movie where year <1970 or year > 2000)
3
and stars < 4
Press ESC then TAB or click outside of the code editor to exit
correctCorrect

Correct

To check your data modification statement, we ran the following query after your modification: select R.rID, R.mID, R.stars, M.title, M.year from Rating R join Movie M on (R.mID = M.mID) order by R.rID, R.mID

Your Query Result:
201	101	4	Gone with the Wind	1939
202	106	4	Snow White	1937
203	108	2	Raiders of the Lost Ark	1981
203	108	4	Raiders of the Lost Ark	1981
205	104	2	E.T.	1982
205	108	4	Raiders of the Lost Ark	1981
206	106	5	Snow White	1937
207	107	5	Avatar	2009
208	104	3	E.T.	1982

Expected Query Result:
201	101	4	Gone with the Wind	1939
202	106	4	Snow White	1937
203	108	2	Raiders of the Lost Ark	1981
203	108	4	Raiders of the Lost Ark	1981
205	104	2	E.T.	1982
205	108	4	Raiders of the Lost Ark	1981
206	106	5	Snow White	1937
207	107	5	Avatar	2009
208	104	3	E.T.	1982
SubmitSome problems have options such as save, reset, hints, or show answer. These options follow the Submit button.

ResetReset Your Answer
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

Question 1: processing