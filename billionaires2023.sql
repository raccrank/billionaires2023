select *

from `billionaires-by-country-2024`

# How many billionaires exist?

select 
count(BillionairesRichestBillionaire2023) as no_of_billionaires

from `billionaires-by-country-2024`

# How many billionaires are in each continent and their networth?

select
region,
round(avg(BillionairesTotalNetWorth2023), 2) as avg_net,
count(BillionairesRichestBillionaire2023) as no_of_billionaires

from `billionaires-by-country-2024`
group by 1
order by 2 desc;

# Billionaires net worth as a pct of the whole world
with data as(
select
region,
count(BillionairesRichestBillionaire2023) as no_of_billionaires,
round(sum(BillionairesTotalNetWorth2023), 2) as total_networth

from `billionaires-by-country-2024`
 group by 1)
 
 select
round(sum(case when region = 'Africa' then total_networth  else 0 end)/ sum(total_networth)*100, 2) as africa_networth,
round(sum(case when region = 'Asia' then total_networth  else 0 end) /sum(total_networth)*100, 2) as asia_networth,
 round(sum(case when region = 'North America' then total_networth  else 0 end) /sum(total_networth)*100, 2) as north_america_networth,
 round(sum(case when region = 'South America' then total_networth  else 0 end)/ sum(total_networth)*100, 2) as south_america_networth,
 round(sum(case when region = 'Europe' then total_networth  else 0 end)/ sum(total_networth)*100, 2) as europe_networth,
 round(sum(case when region = 'Ocenia' then total_networth  else 0 end) /sum(total_networth)*100, 2) as ocenia_networth

from data ;

# Top 5 billionaires

select
BillionairesRichestBillionaire2023,
BillionairesTotalNetWorth2023,
region

from `billionaires-by-country-2024`
order by 2 desc
limit 5;

#Billionaires vs population
select
region,
count(BillionairesRichestBillionaire2023) as no_of_billionaires,
round(avg(population_density_km), 2) as avg_population_density

from `billionaires-by-country-2024`
group by 1
order by 3 desc;





