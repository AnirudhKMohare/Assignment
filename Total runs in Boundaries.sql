use IPL
select season_year,
Fours,
Sixes,
sum(fours*4+Sixes*6) as total_runs_in_boundries 
from (SELECT season.season_year, 
       Sum (CASE 
              WHEN batsman_scored.runs_scored = 4 THEN 1 
              ELSE 0 
            END) AS 'Fours', 
       Sum (CASE 
              WHEN batsman_scored.runs_scored = 6 THEN 1 
              ELSE 0 
            END) AS 'Sixes' 
FROM   match 
       INNER JOIN season 
               ON match.season_id = season.season_id 
       INNER JOIN batsman_scored 
               ON batsman_scored.match_id = match.match_id 
GROUP  BY season.season_year )a
group by season_year,Fours,Sixes