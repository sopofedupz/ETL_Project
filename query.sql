-- Create tables for raw data to be loaded into

drop table sars03_data;

create table sars03_data (
country VARCHAR (255) PRIMARY KEY not null,
confirmed_sars INT not null,
deaths_sars INT not null,
recovered_sars INT not null
);
select * from sars03_data;

drop table ncov19_data;

create table ncov19_data (
country VARCHAR (255) PRIMARY KEY not null,
confirmed_ncov INT not null,
deaths_ncov INT not null,
recovered_ncov INT not null
);
select * from ncov19_data;

-- Join tables
SELECT CASE
          WHEN s.country IS NULL THEN n.country
          WHEN n.country IS NULL THEN s.country
		  ELSE n.country
       END,
	   confirmed_sars,
	   deaths_sars,
	   recovered_sars,
	   coalesce(confirmed_ncov,0) as confirmed_ncov,
	   coalesce(deaths_ncov,0) as deaths_ncov,
	   coalesce(recovered_ncov,0) as recovered_ncov
FROM sars03_data s
FULL OUTER JOIN ncov19_data n
ON s.country=n.country;