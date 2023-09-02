Select 
	ID,
	[Name] as 'Competitor name',
	case when sex = 'M' then 'Male' else 'Female' end as sex,
	Age,
	case when Age < 18 then 'Under 18'
		 when Age between 18 and 25 then '18-25'
		 when Age between 25 and 30 then '25-30'
		 when Age > 30 then 'Over 30'
		end 
		as [Age grouping],
		[Height],
		[Weight],
		[NOC] as 'Nation Code',
		--CHARINDEX(' ',Games)-1 as 'Example 1',
		--CHARINDEX(' ',Reverse(Games))-1 as 'Example 2',
		LEFT(Games,CHARINDEX(' ',Games)-1) as 'Year',
		--RIGHT(Games,CHARINDEX(' ',Reverse(Games))-1) as 'Season',
		--[Games],
		--[city],
		[Sport],
		[Event],
		case when Medal = 'NA' then 'Not Registered' else Medal end as Medal
		From [olympic_games].[dbo].[athletes_event_results]
		where RIGHT(Games,CHARINDEX(' ',Reverse(Games))-1) = 'Summer'
