-- Create tables for raw data to be loaded into

drop table sars03_data;

create table sars03_data (
Country VARCHAR (255) PRIMARY KEY not null,
Confirmed_SARS INT not null,
Deaths_SARS INT not null,
Recovered_SARS INT not null
);
select * from sars03_data;

drop table ncov19_data;

create table ncov19_data (
Country VARCHAR (255) PRIMARY KEY not null,
Confirmed_NCOV INT not null,
Deaths_NCOV INT not null,
Recovered_NCOV INT not null
);
select * from ncov19_data;

-- Joins tables
select sars03_data.Country, ncov19_data.Country, Confirmed_SARS, Deaths_SARS, Recovered_SARS, Confirmed_NCOV, Deaths_NCOV, Recovered_NCOV
from sars03_data
full outer join ncov19_data
on sars03_data.Country = ncov19_data.Country;


--Append tables
--insert into sars03_data (Country, Confirmed_SARS, Deaths_SARS, Recovered_SARS)
--select Country, Confirmed_NCOV, Deaths_NCOV, Recovered_NCOV
--from ncov19_data