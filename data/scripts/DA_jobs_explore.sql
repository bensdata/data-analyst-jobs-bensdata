--Q1: How many rows are in the data_analyst_jobs table?

-- SELECT COUNT(*)
-- FROM data_analyst_jobs;

-- 1793 rows in the table

-- Q2: Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

-- SELECT *
-- FROM data_analyst_jobs
-- LIMIT 10;

-- ExxonMobil

--Q3: How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE (location) = 'TN' 
-- OR (location) = 'KY';

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE location in ('TN', 'KY');

-- Tennessee postings: 21
-- Tennessee or Kentucky postings: 27

-- Q4: How many postings in Tennessee have a star rating above 4?

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE (location) = 'TN' 
-- AND star_rating > 4; --4 doesn't need '' because it is in a column that is numeric

-- postings with star rating above 4: 3
 
 --Q5: How many postings in the dataset have a review count between 500 and 1000?

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE review_count BETWEEN '500' AND '1000';

-- 151 postings with review count between 500 and 1000
 
 --Q6: Show the average star rating for each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
 
--  SELECT location as state, ROUND(AVG(star_rating),2) as avg_rating
--  FROM data_analyst_jobs
--  WHERE star_rating NOTNULL 
--  GROUP BY location
--  ORDER BY avg_rating DESC;
 
 --Q7: Select unique job titles from the data_analyst_jobs table. How many are there?
 
--  SELECT COUNT(DISTINCT(title))
--  FROM data_analyst_jobs;
 
 -- 881 unique job titles
 
 --Q8: How many unique job titles are there for California companies?

-- SELECT COUNT(DISTINCT(title))
-- FROM data_analyst_jobs
-- WHERE location = 'CA';

-- 230 california unique job titles

--Q9: Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?


-- SELECT company, COUNT(location), ROUND(AVG(star_rating),2)
-- FROM data_analyst_jobs
-- WHERE review_count > 5000 AND company is not null
-- GROUP BY company
-- ORDER BY COUNT(location) desc;

--40 companies with more than 5000 reviews

--Alternate answer

-- SELECT company, COUNT(location), AVG(star_rating), review_count
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- GROUP BY company, review_count
-- ORDER BY COUNT(location) desc;

-- 46 companies, why does adding the review_count change the result? - Diego had a reasoning for this

--Q10: Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- SELECT company, COUNT(location), AVG(star_rating), review_count
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- GROUP BY company, review_count
-- ORDER BY AVG(star_rating) desc;

-- six-way tie, star rating: 4.19999

--Q11:Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

-- SELECT distinct title, count(title), location
-- FROM data_analyst_jobs
-- WHERE title ilike '%analyst%'
-- GROUP BY title, location
-- ORDER BY COUNT(title) DESC;

-- Answer: 774

--Q12: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT *
FROM data_analyst_jobs
WHERE title not ilike '%analyst%'
AND title not ilike '%analytics%';

-- 4 job titles, Tableau is the common word