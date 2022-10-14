/* As a data analysis intern, you have to analyze sports data for a client. You are given two datasets related to IPL (Indian Premier League) cricket matches. 
One dataset contains ball-by-ball data and the other contains match-wise data. You have to import the datasets into an SQL database
and perform the tasks given in this assignment to find important insights from this dataset. Write queries in SQL for the following tasks: 

1. Create a table named ‘matches’ with appropriate data types for columns */

create table matches(
id varchar(50),
	inning int,
	over_no int,
	ball int,
	batsman char(100),
	non_striker char(100),
	bowler char(100),
	batsman_runs int,
	extra_runs int,
	total_runs int,
	is_wicket boolean,
	dismissal_kind varchar(100),
	player_dismissed varchar(100),
	fielder char(100),
	extras_type varchar(100),
	batting_team varchar(100),
	bowling_team varchar(100));


/* 2. Create a table named ‘deliveries’ with appropriate data types for columns */

create table deliveries(
	id int,
	city char(100),
	date_match date,
	player_of_match char(100),
	venue char(100),
	neutral_venue char(100),
	team1 char(100),
	team2 char(100),
	toss_winner char(100),
	toss_decision char(100),
	winner char(100),
	result_match varchar(100),
	result_margin int,
	eliminator char(100), 
	method_match char(100),
	umpire1 char(100),
	umpire2 char(100));

/* 3. Import data from CSV file ’IPL_matches.csv’ attached in resources to ‘matches’ */

copy matches from 'C:\Program Files\PostgreSQL\14\data\IPL_Ball.csv' delimiter ',' csv header; 

/* 4. Import data from CSV file ’IPL_Ball.csv’ attached in resources to ‘deliveries’ */

copy deliveries from 'C:\Program Files\PostgreSQL\14\data\IPL_matches.csv' delimiter ',' csv header; 

/* 5. Select the top 20 rows of the deliveries table. */

select * from matches LIMIT 20;

/* 6. Select the top 20 rows of the matches table. */

select * from deliveries LIMIT 20;

/* 7. Fetch data of all the matches played on 2nd May 2013. */

select * from deliveries WHERE date_match='2013-05-02';

/* 8. Fetch data of all the matches where the margin of victory is more than 100 runs. */

select * from deliveries WHERE result_margin>100;

/* 9. Fetch data of all the matches where the final scores of both teams tied and order it in descending order of the date. */

select * from deliveries WHERE winner='NA' order by date_match DESC;

/* 10. Get the count of cities that have hosted an IPL match. */

	select count(city) from deliveries 
