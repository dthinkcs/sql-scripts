-- Movie ( mID, title, year, director )
-- English: There is a movie with ID number mID, a title, a release year, and a director.

-- Reviewer ( rID, name )
-- English: The reviewer with ID number rID has a certain name.

-- Rating ( rID, mID, stars, ratingDate )
-- English: The reviewer rID gave the movie mID a number of stars rating (1-5) on a certain ratingDate.



-- Q1
-- 0.0/1.0 point (graded)
-- Find the titles of all movies directed by Steven Spielberg.
 
SELECT title
FROM Movie
WHERE director = "Steven Spielberg";


-- Q2
-- 0.0/1.0 point (graded)
-- Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order.
-- BUGS Distinct
SELECT DISTINCT year 
FROM Movie 
    INNER JOIN Rating
    ON Movie.mID = Rating.mID
WHERE stars = 4 OR stars = 5
ORDER BY year;

-- Q3
-- 0.0/1.0 point (graded)
-- Find the titles of all movies that have no ratings(not even null).
SELECT title
FROM Movie
WHERE mID NOT IN (
    SELECT mID
    FROM Rating
);

Q4
0.0/1.0 point (graded)
Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date.
SELECT name 
FROM Reviewer
    INNER JOIN Rating
    ON Reviewer.rID = Rating.rID
WHERE ratingDate IS NULL;

Q5
0.0/1.0 point (graded)
Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. 
Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars.
SELECT name, title, stars, ratingDate
FROM Reviewer, Rating, Movie
WHERE Movie.mID = Rating.mID AND Rating.rID = Reviewer.rID
ORDER BY name, title, stars;

-------HARD PARTS--------------

Q6
0.0/1.0 point (graded)
For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie.
-- select all movies which one reviewer has reviewd twice
SELECT Rating.mID AS movieID, stars
FROM (
    SELECT mID
    FROM Rating
    GROUP BY rID, mID  
    HAVING COUNT(*)  >= 2
) AS t INNER JOIN Rating ON Rating.mID = t.mID
GROUP BY Rating.mID 
 

SELECT name, title
FROM (
    SELECT Rating.mID AS mID, stars, rID
    FROM Rating INNER JOIN (
        SELECT mID, MAX(ratingDate) AS mrd
        FROM Rating
        WHERE mID IN (
            SELECT mID
            FROM Rating
            GROUP BY rID, mID  
            HAVING COUNT(*)  >= 2
        )
        GROUP BY mID
    ) AS T ON T.mID = Rating.mID AND T.mrd = Rating.ratingDate 
) AS FinalRating 
INNER JOIN (
    SELECT Rating.mID as mID, stars, rID
    FROM Rating INNER JOIN (
        SELECT mID, MIN(ratingDate) AS mrd
        FROM Rating
        WHERE mID IN (
            SELECT mID
            FROM Rating
            GROUP BY rID, mID  
            HAVING COUNT(*)  >= 2
        )
        GROUP BY mID
    ) AS T ON T.mID = Rating.mID AND T.mrd = Rating.ratingDate
) AS InitialRating ON FinalRating.mID = InitialRating.mID
INNER JOIN Reviewer ON Reviewer.rID = FinalRating.rID
INNER JOIN Movie ON Movie.mID = FinalRating.mID
WHERE FinalRating.stars > InitialRating.stars



SELECT name, title
FROM (
    SELECT Rating.mID AS mID, stars, rID
    FROM Rating INNER JOIN (
        SELECT mID, MAX(ratingDate) AS mrd
        FROM Rating
        WHERE mID IN (
            SELECT mID
            FROM Rating
            GROUP BY rID, mID  
            HAVING COUNT(*)  >= 2
        )
        GROUP BY mID
    ) AS T ON T.mID = Rating.mID AND T.mrd = Rating.ratingDate 
) AS fr 
INNER JOIN (
    SELECT Rating.mID as mID, stars, rID
    FROM Rating INNER JOIN (
        SELECT mID, MIN(ratingDate) AS mrd
        FROM Rating
        WHERE mID IN (
            SELECT mID
            FROM Rating
            GROUP BY rID, mID  
            HAVING COUNT(*)  >= 2
        )
        GROUP BY mID
    ) AS T ON T.mID = Rating.mID AND T.mrd = Rating.ratingDate
) AS ir ON fr.mID = ir.mID
INNER JOIN Reviewer ON Reviewer.rID = fr.rID
INNER JOIN Movie ON Movie.mID = fr.mID
WHERE fr.stars > ir.stars




-- Q7
-- 0.0/1.0 point (graded)
-- For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. 
SELECT title, MAX(stars)
FROM Rating INNER JOIN Movie ON Movie.mID = Rating.mID
GROUP BY Rating.mID
ORDER BY title

-- Q8
-- 0.0/1.0 point (graded)
-- For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title.
SELECT MaximumStar.title, maxStar - minStar
FROM (
    SELECT title, MAX(stars) AS maxStar
    FROM Rating INNER JOIN Movie ON Movie.mID = Rating.mID
    GROUP BY Rating.mID
    ORDER BY title
) AS MaximumStar 
INNER JOIN
(
    SELECT title, MIN(stars) AS minStar
    FROM Rating INNER JOIN Movie ON Movie.mID = Rating.mID
    GROUP BY Rating.mID
    ORDER BY title
) AS MinimumStar
ON MaximumStar.title = MinimumStar.title
ORDER BY maxStar - minStar DESC, MaximumStar.title



Q9
-- 0.0/1.0 point (graded)
-- Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.)

SELECT AVG(beforeAVG) AS finalBeforeAVG
FROM (
    SELECT AVG(rating) AS beforeAVG
    FROM Rating JOIN Movie ON Movie.mID = Rating.rID
    WHERE Movie.year < 1980
    GROUP BY Rating.mID
)   
AS beforeEighty JOIN (
    SELECT Movie.mID AS AVG(rating) AS afterAVG, title
    FROM Rating JOIN Movie ON Movie.mID = Rating.rID
    WHERE Movie.year > 1980
    GROUP BY Rating.mID
) AS afterEighty ON beforeEighty.mID = afterEighty.mID

-- sometimes shorter names are better
select max(a1)-min(a1) from
(select avg(av1) a1 from
(select avg(stars) av1 from rating r join movie m on r.mid=m.mid where m.year < 1980
group by r.mid)
union
select avg(av2) a1 from
(select avg(stars) av2 from rating r join movie m on r.mid=m.mid where m.year > 1980
group by r.mid))


SQL Movie-Rating Modification Exercises
Add the reviewer Roger Ebert to your database, with an rID of 209.

insert into Reviewer(rID, name) values (209, 'Roger Ebert')
insert into Reviewer values (209, 'Roger Ebert')


Insert 5-star ratings by James Cameron for all movies in the database. Leave the review date as NULL.

insert into Rating  ( rID, mID, stars, ratingDate )
select Reviewer.rID , Movie.mID, 5, null from Movie
left outer join Reviewer
where Reviewer.name='James Cameron'


For all movies that have an average rating of 4 stars or higher, add 25 to the release year. (Update the existing tuples; don't insert new tuples.)

update movie
set year = year + 25
where mID in (
  select mID from (
  select AVG(stars) as astar, mID from Rating
  where mID=rating.mID
  group by mID
  having astar >=4)
)
Remove all ratings where the movie's year is before 1970 or after 2000, and the rating is fewer than 4 stars.

delete from rating
where mID in (select mID from movie where year <1970 or year > 2000)
and stars < 4
