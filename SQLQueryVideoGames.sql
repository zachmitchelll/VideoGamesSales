
--Location of the data
	--https://www.kaggle.com/datasets/kendallgillies/video-game-sales-and-ratings

--Video Games Sales data between the years 1976 and 2017.
--The data only includes games that sold over 100,000 copies.
--NA Sales, EU Sales, JP Sales, Other Sales, and Global Sales are in Millions.



--Checking to Make sure all the rows were uploaded correctly.

Select *
From VideoGame.dbo.VGsales
order by Year_of_Release


--How many games were released for each platform?

Select Distinct Platform, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Platform
Order by Platform Asc


--Amount of sales for each location

SELECT ROUND(SUM(NA_Sales),2) as NorthAmerica, 
	ROUND(SUM(EU_Sales),2) as Europe, 
	ROUND(SUM(JP_Sales),2) as Japan, 
	ROUND(SUM(Other_Sales),2) as Other, 
	ROUND(SUM(Global_Sales),2) as Global
FROM VideoGame.dbo.VGsales


--What type of game genre had the most sales?

Select DISTINCT Genre, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Genre
Order by Genre


--Which publisher had the most games?

Select DISTINCT Publisher, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Publisher
Order by Games desc


--Which years released the most games?

Select DISTINCT Year_of_Release, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Year_of_Release
order by Year_of_Release


--Has sales increased as each year passes by?

Select Year_of_Release, ROUND(SUM(Global_Sales),2) as GlobalSales
From VideoGame.dbo.VGsales
where Year_of_Release BETWEEN 1976 and 2017
group by Year_of_Release
order by Year_of_Release