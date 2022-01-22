show databases;
create database fifa19;
use fifa19;

create table players (
    ID int,
    name varchar(255), 
    age int(3),
    nationality varchar(255),
    overallrating int,
    potentialrating int,
    club varchar(255),
    value int, 
    wage int, 
    prefferedfoot ENUM("Left","Right"),
    jerseynumber int,
    joined datetime,
    height varchar(10),
    weight int(3), 
    penalties int(3)
)

load data local infile "C:/Users/pranj/Downloads/fifa19.csv" into table players CHARACTER SET latin1 columns terminated by "," optionally enclosed by "'" ignore 1 lines;

desc players;

select * from players limit 5;

select * from players limit 5\G;

 select name from players where wage = (select max(wage) from players);

 select name from players where wage = (select min(wage) from players);

select name from players where overallrating = (select max(overallrating) from players);

select avg(overallrating) as avg_rating, club from players group by club order by avg_rating desc limit 3;

select count(*) as freq, prefferedfoot from players group by 2 order by 1 desc;

select sum(wage) as tot_wage, jerseynumber from players group by jerseynumber;

select sum(wage) as tot_wage, jerseynumber from players group by jerseynumber order by tot_wage desc limit 1;

select count(*) as freq, nationality from players where club like "M%" group by nationality;

select count(*) from players where joined >= "2018-05-20" and joined <= "2019-04-10";

select count(*) as freq, joined from players group by joined;

select count(*) as freq, year(joined) from players group by year(joined);
