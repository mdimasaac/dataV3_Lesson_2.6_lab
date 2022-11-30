-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, 
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT 
    first_name, last_name, COUNT(*)
FROM
    actor
GROUP BY last_name
HAVING COUNT(*) <= 1;
-- got confused between WHERE and HAVING
-- 2. Which last names appear more than once? We would use the same logic as in the previous question 
-- but this time we want to include the last names of the actors where the last name was present more than once
SELECT 
    first_name, last_name, COUNT(*)
FROM
    actor
GROUP BY last_name
HAVING COUNT(*) > 1;
-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT 
    staff_id, COUNT(*)
FROM
    rental
GROUP BY staff_id;
-- group by each employee
-- 4. Using the film table, find out how many films were released each year.
SELECT 
    release_year, COUNT(*)
FROM
    film
GROUP BY release_year;
-- group by release year
-- 5. Using the film table, find out for each rating how many films were there.
SELECT 
    rating, COUNT(*) AS num_of_films
FROM
    film
GROUP BY rating;
-- 6. What is the mean length of the film for each rating type.
--    Round off the average lengths to two decimal places
SELECT 
    rating, ROUND(AVG(length), 2) AS avg_length
FROM
    film
GROUP BY rating;
-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT 
    rating, ROUND(AVG(length), 2) AS avg_length
FROM
    film
GROUP BY rating
HAVING AVG(length) > 120;
-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). 
--    In your output, only select the columns title, length, and the rank.
select title, length, dense_rank() over(order by length desc)
as length_rank from film order by length desc;
-- couldn't think of any other method that does like dense_rank(). i give up
