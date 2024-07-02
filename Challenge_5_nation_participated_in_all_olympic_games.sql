-- Which nation has participated in all of the olympic games?
select distinct n.region as country, count(distinct a.games) as total_games_participated from athlete_details a
join noc n on a.noc = n.noc
group by n.region
order by 2 desc
limit 4;

-- OR
with t1 as
(select distinct n.region as country, count(distinct a.games) as total_games_participated from athlete_details a
join noc n on a.noc = n.noc
group by n.region),
t2 as
(select *, rank() over(order by total_games_participated desc) as rnk from t1)
select country, total_games_participated from t2 where rnk <=4;

