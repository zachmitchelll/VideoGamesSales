
--Location of the data
	--https://www.kaggle.com/datasets/kendallgillies/video-game-sales-and-ratings
--The visuals for this project can be found on tableau.
	--https://public.tableau.com/app/profile/zach.mitchell

--Video Games Sales data between the years 1976 and 2017.
--The data only includes games that sold over 100,000 copies.
--NA Sales, EU Sales, JP Sales, Other Sales, and Global Sales are in Millions.
--*The data avaible in this dataset only shows a small portion of the 2017 data. It does not represent the entire year of 2017.*



--Checking to Make sure all the rows were uploaded correctly.

Select *
From VideoGame.dbo.VGsales
order by Year_of_Release


--How many games were released for each platform?
--By using this function we can see the order of platforms that had the most games that sold over 100,000 copies to the lowest.

Select Distinct Platform, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Platform
--Order by Platform Asc
order by Games desc



--Amount of sales for each location
--This allows us to see that North America has the most sales followed by Europe, Japan, and Other.

SELECT ROUND(SUM(NA_Sales),2) as NorthAmerica, 
	ROUND(SUM(EU_Sales),2) as Europe, 
	ROUND(SUM(JP_Sales),2) as Japan, 
	ROUND(SUM(Other_Sales),2) as Other, 
	ROUND(SUM(Global_Sales),2) as Global
FROM VideoGame.dbo.VGsales



--What game genre had the most games that sold over 100,000 copies?
--The Action genre had the most games at a count of 3503.

Select DISTINCT Genre, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Genre
--Order by Genre
order by Games desc



--Which publisher had the most games?
--Electronic Arts had published the most games at a count of 1380 that sold over 100,000 copies.

Select DISTINCT Publisher, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Publisher
Order by Games desc


--Which years released the most games?
--2009 had the most games that released with over 100,000 copies sold at 1551 games.

Select DISTINCT Year_of_Release, COUNT(Name) as Games
From VideoGame.dbo.VGsales
Group by Year_of_Release
--order by Year_of_Release
order by Games desc


--Has sales increased as each year passes by?
--There is a gradual increase in gaming sales from 1976 to 2009. After 2009 there is a decrease in sales up to 2016.

Select Year_of_Release, ROUND(SUM(Global_Sales),2) as GlobalSales
From VideoGame.dbo.VGsales
where Year_of_Release BETWEEN 1976 and 2017
group by Year_of_Release
order by Year_of_Release


--What Genre of games had the most sales?
--The action genre had the most sales globally with over 1.7 billion sales.

Select Genre, ROUND(SUM(Global_Sales),2) as GlobalSales
From VideoGame.dbo.VGsales
group by Genre
order by GlobalSales desc
