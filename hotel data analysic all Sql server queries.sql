
/*  USE A DATABASE NAMED HOTEL DATA ANALYSIS    */
use[Hotel Data Analysis]
select * from dbo.[2018]
select * from dbo.[2019]
select * from dbo.[2020])


/* we will first create a single temporary table hotels that combines all the data using following code for easier access and analysis.   */
with hotels as(
select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

Select * from hotels


/* select 
  (stays_in_week_nights + stays_in_weekend_nights) * adr as revenue from hotels  */




  /* Q1: Revenue Group with respect to year*/
  with hotels as(
select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])
select 
arrival_date_year, hotel ,
round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr),0)        --  0 is for round function 
as revenue from hotels group by arrival_date_year, hotel





--Q2: Should we increase our parking lot size?   we will focus on the car_parking_spaces and number of guests staying in the hotel

with hotels as(
select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])
select
arrival_date_year, hotel,

sum((stays_in_week_nights + stays_in_weekend_nights) * adr) as renenue,

concat (round((sum(required_car_parking_spaces)/sum(stays_in_week_nights +

stays_in_weekend_nights)) * 100, 2), '%') as parking_percentage

from hotels group by arrival_date_year, hotel 

--In the RESULT table we can observe that we have enough space for parking. So, there is no need to increase our parking lot size.




--JOins for importing data into powerbi


SELECT * FROM [dbo].[Market_segment]
SELECT * FROM [dbo].[meal_cost$]


with hotels as(
select * from dbo.[2018]
union
select * from dbo.[2019]
union
select * from dbo.[2020])

select * from hotels
left join dbo.market_segment
on hotels.market_segment = market_segment.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = hotels.meal