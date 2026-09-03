create database airline_operations;
use airline_operations;
-- Total Flights
select count(distinct flight_id) as Total_Flights from final_airline_cleaned;
-- Total passengers
select sum(passengers) as Total_Passengers from final_airline_cleaned; 
-- Total Revenue
select sum(ticket_price*passengers) as Total_Revenue from final_airline_cleaned;
-- Average Ticket Price
select round(avg(ticket_price),2) as Average_Ticket_Price from final_airline_cleaned;
-- Average Departure Delay
select round(avg(departure_delay),2) as Average_Departure_Delay from final_airline_cleaned;
-- Cancellation_Rate(%)
select round(sum(case when cancelled='True' then 1 else 0 end)/count(*)*100,2)
as Cancellation_Rate from final_airline_cleaned;
-- Flights by Airline
select airline,count(distinct flight_id) as Numbers_of_Flights from final_airline_cleaned 
group by airline order by Numbers_of_Flights desc limit 5;
-- Flights by Status
select status,count(distinct flight_id) as Numbers_of_Flights from final_airline_cleaned 
group by status order by Numbers_of_Flights desc;
-- Cancellation Rate by Airline
select airline,round(sum(case when cancelled='True' then 1 else 0 end)*100/count(flight_id),2) as cancellation_rate from final_airline_cleaned 
group by airline order by cancellation_rate desc limit 5;
-- Average Departure Delay by Airline
select airline ,round(avg(departure_delay),2) as Average_Departure_Delay from final_airline_cleaned
group by airline order by Average_Departure_Delay desc limit 5;
-- Passengers and Revenue by Airline
select airline, sum(passengers) as passengers,round(sum(ticket_price*passengers),2) as Revenue from final_airline_cleaned
group by airline order by Revenue ;
-- Flights Over Time
select monthname(flight_date) as month ,count(flight_id) 
as Number_of_Flights from final_airline_cleaned
where airline<> 'Unknown'
group by month(flight_date),monthname(flight_date) order by month(flight_date);





