Select * 
From Project..CovidDeaths 
Where continent is not null
order by 3,4

--Looking at the data we will be working with
Select continent,location, date, total_cases,new_cases,total_deaths,population, hosp_patients, reproduction_rate, icu_patients
From Project..CovidDeaths
Where continent is not null
order by 1,2

--Looking at the statitics of European Countries

--Total Deaths Ratio to Total Cases
--Probability of dying from Covid
Select Continent, Location, SUM(total_cases) as TotalCases ,SUM(cast(total_deaths as bigint)) as TotalDeaths, SUM(cast(total_deaths as bigint))/SUM(total_cases)*100 as PercentageofDeaths
From Project..CovidDeaths
Where continent like 'Europe'
Group by continent,location
order by location


--Population to Total Cases Ratio
--Looking at the probability of catching covid
Select Continent,Location, SUM(total_cases) as TotalCases ,SUM(population) as Population, SUM(total_cases)/SUM(population)*100 as ProbabilityofInfection
From Project..CovidDeaths
Where continent like 'Europe'
Group by continent,location
order by location

--Hospital Patients to Total Cases Ratio
--Looking at the percentage of people who become hospital patients after catching Covid
Select Continent,Location, SUM(total_cases) as TotalCases ,SUM(cast(hosp_patients as int)) as HospitalPatients, SUM(cast(hosp_patients as int))/SUM(total_cases)*100 as Rate_of_hosp_patients
From Project..CovidDeaths
Where continent like 'Europe'
Group by continent,location
order by location

--ICU Patients to Total Deaths Ratio
--Looking at the percentage of people dead after being admitted to ICU_
Select Continent,Location, SUM(cast(total_deaths as float)) as TotalDeaths ,SUM(cast(icu_patients as float)) as ICU_Patients, SUM(cast(icu_patients as float))/SUM(cast(total_deaths as float))*100 as ICU_Mortality_rate
From Project..CovidDeaths
Where continent like 'Europe'
Group by continent,location
order by location