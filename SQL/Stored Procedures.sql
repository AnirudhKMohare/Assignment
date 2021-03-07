use IPL
go

create procedure dbo.max_fours
as
select v.Venue_Name,  
sum(case when([Runs_Scored]=4) then 1 else 0 end) Fours,
count(distinct m.Match_Id) Matches,
sum(case when([Runs_Scored]=4) then 1 else 0 end)/count(distinct m.Match_Id) Fours_Per_Match
from [dbo].[Batsman_Scored]  b 
inner join Match m on b.Match_Id=m.Match_Id
inner join Venue v on v.Venue_Id=m.Venue_Id
group by v.Venue_Name
order by 2 desc
go

exec dbo.max_fours
go

create procedure dbo.city_1
@city_id nvarchar(30) 
as 
select * from dbo.city
where city_id=@city_id
go

exec dbo.city_1 @city_id=16
go

create procedure dbo.batsmanscored
@match_id nvarchar(30)  = null,
@runs_scored nvarchar(30) = null
as select * from dbo.batsman_scored
where match_id=@match_id and runs_scored=@runs_scored
go

exec dbo.batsmanscored @match_id=335987,@runs_scored=4
go

create procedure dbo.max_sixes
as
select v.Venue_Name,  sum(case when([Runs_Scored]=6) then 1 else 0 end) Sixes,count(distinct m.Match_Id) Matches,sum(case when([Runs_Scored]=6) then 1 else 0 end)/count(distinct m.Match_Id) Sixes_Per_Match
from [dbo].[Batsman_Scored]  b 
inner join Match m on b.Match_Id=m.Match_Id
inner join Venue v on v.Venue_Id=m.Venue_Id
group by v.Venue_Name
order by 2 desc
go

exec dbo.max_sixes
