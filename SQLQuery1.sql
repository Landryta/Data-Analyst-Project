select COUNTRY, MAX(TOTAL_VACCINATIONS_PER100) as HighestVaccinationCount from ['vaccination-data$']
Group by COUNTRY, TOTAL_VACCINATIONS_PER100
order by HighestVaccinationCount desc

select COUNTRY, MAX(PERSONS_VACCINATED_1PLUS_DOSE_PER100) as HighestVaccinatedPlusDose from ['vaccination-data$']
Group by COUNTRY, PERSONS_VACCINATED_1PLUS_DOSE_PER100
order by HighestVaccinatedPlusDose desc

select COUNTRY, MAX(PERSONS_BOOSTER_ADD_DOSE_PER100) as ExtraBooster from ['vaccination-data$']
Group by COUNTRY, PERSONS_BOOSTER_ADD_DOSE_PER100
order by ExtraBooster desc

select COUNTRY, MAX(PERSONS_BOOSTER_ADD_DOSE_PER100) as ExtraBooster, MAX(TOTAL_VACCINATIONS_PER100) as HighestVaccinationCount,  MAX(PERSONS_VACCINATED_1PLUS_DOSE_PER100) as HighestVaccinatedPlusDose from ['vaccination-data$']
Group by country, PERSONS_BOOSTER_ADD_DOSE_PER100, TOTAL_VACCINATIONS_PER100, PERSONS_VACCINATED_1PLUS_DOSE_PER100
order by HighestVaccinationCount desc, HighestVaccinatedPlusDose desc, ExtraBooster desc

-- Highest Vaccination per 100: Chile, Brunei, Palau, Pitcaim Islands, Vietnam
-- Highest Vaccination Extra Dose per 100: Samoa, Palau, Pitcaim Islands, Brunei, Niue
-- ExtraBooster top 5 countries: Chile, Brunei, Singapore, Bhutan, Italy

select Name as COUNTRY, MAX([Deaths - cumulative total per 100000 population]*100) as CUMULATIVEdeaths,
	MAX(TOTAL_VACCINATIONS_PER100) as HighestVaccinationCount from DEATHCOVID$
INNER JOIN ['vaccination-data$']
	on ['vaccination-data$'].COUNTRY = DEATHCOVID$.Name
Group by Name, [Deaths - cumulative total per 100000 population]
order by HighestVaccinationCount desc
select AVG(TOTAL_VACCINATIONS_PER100) as VaccinationAverage from ['vaccination-data$']

select Name,[Cases - cumulative total per 100000 population], [Deaths - cumulative total per 100000 population], ([Deaths - cumulative total per 100000 population]/nullif ([Cases - cumulative total per 100000 population], 0))*100 AS DeathPercentPerCase
from DEATHCOVID$
Group by Name, [Cases - cumulative total per 100000 population], [Deaths - cumulative total per 100000 population]

