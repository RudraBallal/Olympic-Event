-- use database jnv
use jnv;

-- STEP 1. create the  table
create  table athletes(
	ID int,
	Name varchar(200),
	Sex char(1),
    Age int,
    Height float,
    Weight float,
    Team varchar(200),
	NOC VARCHAR(5),
    Games varchar(200),
    Year int,
    Season Varchar(200),
    City varchar(200),
    Sports varchar(200),
    Event varchar(200),
    Medal varchar(50));


-- STEP 2. VIEW THE BLANK TABLE
select * from athletes;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


-- STEP 3. VIEWING THE PATH TO ADD FILE
show variables like "secure_file_priv";

-- STEP 3. IMPORT THE TABLE USING LOAD DATA INFILE QUERY
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Cleaned.csv' 
into table athletes
fields terminated by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
ignore 1 rows;
    
-- STEP 4. VIEW THE TABLE ATHLETES
select * from athletes;

-- STEP 5. view no. of rows
select count(*) from athletes;

-- Q1:  Show how many medal counts present for entire data.
select medal, count(medal) as count_medal 
from athletes
group by medal;

-- Q2. Show count of unique Sports are present in olympics.
select count(distinct Sports) as No_Unique_Sports from athletes;

-- Q3. Show how many different medals won by Team India in data.
select medal, count(Medal) as unique_medal from athletes
where Team='India' and medal<>'nomedal'
group by Medal;

-- Q4. Show event wise medals won by india show from highest to lowest medals won in order.
select Event,count(Medal) as T_Medal from athletes
where Team='India' and medal<>'NoMedal'
Group By Event
order By T_Medal desc;

select * from athletes;

-- Q5. Show event and yearwise medals won by india in order of year.
select Event,Year, count(medal) as Medal_won from athletes
where Team='india' and medal<>'NoMedal'
group by Event,Year
order by Year;

-- Q6. Show the country with maximum medals won gold, silver, bronze
select Team,count(medal) as max_medal from athletes
where medal<>'NoMedal'
group by Team
order by max_medal desc
limit 1;

-- Q7. Show the top 10 countries with respect to gold medals
select Team,count(medal) as Gold_count from athletes
where Medal='Gold'
group by Team
order by Gold_count desc
limit 10;

select * from athletes;

-- Q8. Show in which year did United States won most medals
select Year,count(medal) as M_Medal from athletes
where Team='United States' and medal<>'NoMedal'
group by Year
order by M_medal desc
limit 1;

-- Q9. In which sports United States has most medals
select sports,count(medal) as T_Medal from athletes
where Team='United States' and medal<>'NoMedal'
group by sports
order by T_Medal desc
limit 1;

-- Q10.Find top 3 players who have won most medals along with their sports and country.
select Name,Sports,Team, count(medal) as Most_M from athletes
where medal<>'NoMedal'
group by Name,Sports,Team
order by Most_M desc
limit 3;

-- Q11. Find player with most gold medals in cycling along with his country.
select Name,Team,Sports,count(medal) as Most_gold from athletes
where Medal='Gold' and Sports='cycling'
group by Name
order by Most_gold desc
limit 1;

-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.
select Name,Team, count(Medal) as Most_Medal from athletes
where sports='Basketball' and Medal<>'NoMedal'
group by  Name,Team
order by Most_Medal desc
limit 1;

-- Q13. Find out the count of different medals of the top basketball player.
select name,medal,count(medal) as dist_medal from athletes
where name='Teresa Edwards' and medal<>'NoMedal'
group by medal
order by dist_medal desc
limit 1;

select * from athletes;

-- Q14. Find out medals won by male, female each year . Export this data and plot graph in excel.
select Sex,year,count(medal) from athletes
where medal<>'NoMedal'
group by Sex,Year
order by Year;

select * from athletes;

select City, count(distinct City) from  athletes
group by City;


