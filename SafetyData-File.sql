SELECT *
FROM [dbo].['Workplace Safety Data$']

--How many incidents occurred at each plant?
SELECT 
	[Plant],
	COUNT(*) AS No_Of_Incident
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Plant]
	
--What is the total incident cost per department?
SELECT
	Department,
	SUM([Incident Cost]) AS Total_Sum
FROM [dbo].['Workplace Safety Data$']
GROUP BY Department

--Which incident type resulted in the highest total days lost? 
SELECT 
	[Incident Type],
	[Days Lost]
FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] = 5
GROUP BY [Incident Type], [Days Lost]
ORDER BY [Days Lost] DESC

--What is the distribution of incident types by shift?
SELECT 
	[Shift],
	[Incident Type],
	COUNT(*) AS Total_By_Shift
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Shift], [Incident Type]
ORDER BY [Shift], Total_By_Shift DESC

--What is the average incident cost for each injury location?
SELECT 
	[Injury Location],
	AVG([Incident Cost]) AS Avg_Cost
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Injury Location]

--Which age group has the highest number of incidents?
SELECT 
    TOP 1
	[Age Group],
	COUNT(*) AS No_Of_Incident
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Age Group]
ORDER BY No_Of_Incident DESC

--How many incidents were reported as 'Lost Time' by each plant?
SELECT 
	[Plant],
	[Report Type],
	COUNT(*) AS No_Per_Report
FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Lost Time'
GROUP BY [Plant], [Report Type]

--Which department had the highest number of 'Crush & Pinch' incidents?
SELECT TOP 1
	[Department],
	[Incident Type],
	COUNT(*) AS No_By_Department
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Crush & Pinch'
GROUP BY [Department],[Incident Type]
ORDER BY No_By_Department DESC

--Which plants reported the most "Near Miss" incidents?
SELECT
    TOP 1
	[Plant],
	[Report Type],
	COUNT (*) AS No_By_Report
FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Near Miss'
GROUP BY [Plant], [Report Type]
ORDER BY No_By_Report desc

--What is the total number of incidents by year and month?
SELECT 
	[Year],
	[Month],
	COUNT (*) AS Total_month
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Year], [Month]
ORDER BY [Year], [Month] ASC

--Which gender has the most reported incidents?
SELECT 
	TOP 1
	[Gender],
	COUNT(*) AS No_By_Gender
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Gender] 
ORDER BY No_By_Gender DESC

--What is the total cost of incidents per year?
SELECT 
	 [Year],
	SUM([Incident Cost]) AS Total_Per_Year
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Year]

--Which incident resulted in the highest cost?
SELECT TOP 1
	[Incident Type],
	SUM([Incident Cost]) AS Total_By_Incident
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY Total_By_Incident DESC

--What is the total cost of incidents for each report type?
SELECT 
	[Report Type],
	SUM([Incident Cost]) AS Total_By_Type
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Report Type]

--Which departments had incidents with more than 2 days lost?
SELECT 
	[Department],
	[Days Lost],
	[Incident Type]
FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] > 2
GROUP BY [Department], [Days Lost],[Incident Type]

--What is the average number of days lost per incident type?
SELECT 
	[Incident Type],
	ROUND(AVG([Days Lost]), 2) AS Avg_days
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]

--What is the distribution of incidents by shift (Day, Afternoon, Night)?
SELECT 
	[Shift],
	COUNT(*) AS No_By_Shift
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Shift]
ORDER BY 
	CASE [Shift]
	  WHEN 'Day' THEN 1
	  WHEN 'Afternoon' THEN 2
	  WHEN 'Night' THEN 3
	END;

--Which months have the highest number of incidents?
SELECT 
	[Month],
	COUNT(*) AS No_By_Month
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Month]
ORDER BY No_By_Month DESC

--What is the total cost of "Vehicle" related incidents?
SELECT 
	[Incident Type],
	SUM([Incident Cost]) AS Total_Cost
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Vehicle'
GROUP BY [Incident Type]

--Which age group is most affected by "Falling Object" incidents?
SELECT TOP 1
	[Incident Type],
	[Age Group], 
	COUNT (*) AS No_By_Incident
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Falling object'
GROUP BY [Incident Type], [Age Group]
ORDER BY No_By_Incident DESC;
