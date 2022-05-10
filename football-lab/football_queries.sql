DROP TABLE public.matches;
-- 1. Find all the matches from 2017
SELECT * FROM public.matches WHERE season = '2017';

-- 2. Find all the matches featuring Barcelona
SELECT * FROM public.matches WHERE (hometeam = 'Barcelona' OR awayteam = 'Barcelona'); 

-- 3. What are the names of the Scottish divisions included?
SELECT name FROM public.divisions WHERE country='SCOTLAND'

-- 4. Find the division code for the Bundesliga. Use that code to find out how many matches Freiburg have played in the Bundesliga since the data started being collected.
SELECT division_code FROM public.matches WHERE hometeam = 'Bundesliga'

-- 5. Find the unique names of the teams which include the word "City" in their name (as entered in the database)
SELECT * FROM public.matches WHERE (hometeam, awayteam) = 'City';

-- 6. How many different teams have played in matches recordered in a French division?
SELECT COUNT(*) FROM public.matches WHERE division_code = 'F1' OR division_code='F2';

-- 7. Have Huddersfield played Swansea in the period covered? THE ANSWER IS YES
SELECT*FROM public.matches WHERE(hometeam='Hudderfield' OR hometeam='Swansea' AND awayteam='Swansea' OR awayteam='Hudderfield');

-- 8. How many draws were there in the Eredivisie between 2010 and 2015?
SELECT COUNT(*) FROM public.matches WHERE ftr='D' --needs a DISTINCT
    AND (season BETWEEN 2010 AND 2015) 
    AND (hometeam='Eredivisie' OR awayteam='Eredivisie');

-- 9. Select the matches played in the Premier League in order of total goals scored from highest to lowest. Where there is a tie the match with more home goals should come first.
SELECT * FROM public.matches WHERE division_code='SC0' ORDER BY ftr DESC;

-- 10. In which division and which season were the most goals scored? 
SELECT division_code, season FROM public.matches WHERE fthg = (SELECT MAX(fthg) FROM public.matches);
SELECT division_code, season FROM public.matches WHERE ftag = (SELECT MAX(ftag) FROM public.matches); -- MERGE?

-- type your code run the code psql -d football -f football_queries.sql