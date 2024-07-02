-- Which year saw the highest and lowest no of countries participating in olympics?
with t1 as
(select a.games, n.region from athlete_details a
join noc n on a.noc = n.noc 
group by a.games, n.region),
t2 as
(select games, count(*) as number_of_nations from t1
group by games
order by games)
select
(select concat(games, ' - ', number_of_nations) from t2 order by number_of_nations limit 1) as lowest_countries,
(select concat(games, ' - ', number_of_nations) from t2 order by number_of_nations desc limit 1) as highest_countries;
