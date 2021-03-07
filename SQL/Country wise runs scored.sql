use IPL
select season_year,
Fours,
Sixes,
[Country_Name],
sum(fours*4+Sixes*6) as total_runs_in_boundries 
from (SELECT season.season_year,country.Country_Name,
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
	   Inner Join venue
	           ON venue.Venue_Id=Match.Venue_Id
	   Inner Join Country
	           on venue.venue_id=Country.Country_Id
GROUP  BY season.season_year, country.[Country_Name])a
group by season_year,Fours,Sixes,[Country_Name]
order by 1 desc