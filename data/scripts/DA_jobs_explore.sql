--Q1
/*
SELECT COUNT(*)
FROM data_analyst_jobs;
*/
-- 1793 rows in the table

-- Q2
/*
SELECT *
FROM data_analyst_jobs
LIMIT 10;
*/
-- ExxonMobil

--Q3
/*
SELECT *
FROM data_analyst_jobs
WHERE (location) = 'TN' 
OR (location) = 'KY';
*/
-- Tennessee postings: 21
-- Tennessee or Kentucky postings: 27

-- Q4
/*
SELECT *
FROM data_analyst_jobs
WHERE (location) = 'TN' 
AND star_rating > '4';
*/
-- postings with star rating above 4: 3
 
 --Q5
/*
SELECT *
FROM data_analyst_jobs
WHERE review_count BETWEEN '500' AND '1000';
*/
-- 151 postings with review count between 500 and 1000
 
 --Q6
 /*
 SELECT location as state, avg(star_rating) as avg_rating
 FROM data_analyst_jobs
 GROUP BY location;
 */
 
 --Q7
 /*
 SELECT COUNT(DISTINCT(title))
 FROM data_analyst_jobs;
 */
 -- 881 unique job titles
 
 --Q8
/*
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
*/
-- 230 california unique job titles

--Q9

-- SELECT company, COUNT(location), AVG(star_rating)
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- GROUP BY company
-- ORDER BY COUNT(location) desc;

--41 companies with more than 5000 reviews

--Alternate answer

-- SELECT company, COUNT(location), AVG(star_rating), review_count
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- GROUP BY company, review_count
-- ORDER BY COUNT(location) desc;

-- 46 companies, why does adding the review_count change the result?

--Q10

-- SELECT company, COUNT(location), AVG(star_rating), review_count
-- FROM data_analyst_jobs
-- WHERE review_count > 5000
-- GROUP BY company, review_count
-- ORDER BY AVG(star_rating) desc;

-- Microsoft, star rating: 4.19999

--Q11:Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

-- SELECT distinct title, count(title)
-- FROM data_analyst_jobs
-- WHERE title ilike '%analyst%'
-- GROUP BY title
-- ORDER BY COUNT(title) DESC;

-- Answer: 774

--Q12: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

-- SELECT *
-- FROM data_analyst_jobs
-- WHERE title not ilike '%analyst%'
-- AND title not ilike '%analytics%';

-- 4 job titles, Tableau is the common word