use ipl
select v.Venue_Name,  
sum(case when([Runs_Scored]=4) then 1 else 0 end) Fours,
count(distinct m.Match_Id) Matches
from [dbo].[Batsman_Scored]  b 
inner join Match m on b.Match_Id=m.Match_Id
inner join Venue v on v.Venue_Id=m.Venue_Id
group by v.Venue_Name
order by 2 desc

select v.Venue_Name,  sum(case when([Runs_Scored]=6) then 1 else 0 end) Sixes,count(m.Match_Id) Matches,sum(case when([Runs_Scored]=6) then 1 else 0 end)/count(distinct m.Match_Id) Sixes_Per_Match
from [dbo].[Batsman_Scored]  b 
inner join Match m on b.Match_Id=m.Match_Id
inner join Venue v on v.Venue_Id=m.Venue_Id
group by v.Venue_Name
order by 2 desc

