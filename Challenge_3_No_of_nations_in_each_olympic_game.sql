-- Mention the total no of nations who participated in each olympics game?
select a.games, count(distinct n.region) as number_of_nations from athlete_details a
join noc n on a.noc = n.noc 
group by a.games
order by a.games;

-- OR

with t1 as
(select a.games, n.region from athlete_details a
join noc n on a.noc = n.noc 
group by a.games, n.region)
select games, count(region) as number_of_nations  from t1
group by games
order by games;
