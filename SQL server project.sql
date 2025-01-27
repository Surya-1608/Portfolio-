SELECT * FROM [SQL portfolio]..CovidDeaths
ORDER BY 3

--SELECT * FROM [SQL portfolio]..Covidvacinations
--ORDER BY 3

SELECT location, date, total_cases, new_cases, total_deaths, population 
FROM [SQL portfolio]..CovidDeaths
ORDER BY 1


--Total Cases vs Total Deaths
SELECT location, date, total_cases, total_deaths, 
CAST(total_deaths AS float	) /NULLIF  (total_cases,0)*100 AS death_percecnt
FROM [SQL portfolio]..CovidDeaths
ORDER BY 1

--Total cases vs Population
SELECT location, date, total_cases, population, 
CAST(total_cases AS float) /NULLIF(CAST (population AS float) ,0)*100 AS case_percecnt
FROM [SQL portfolio]..CovidDeaths
ORDER BY 1

--High infection rate in each country
SELECT location, MAX(total_cases) AS Highest_Infection_count, population, 
MAX(CAST(total_cases AS float) /NULLIF(CAST (population AS float) ,0))*100 
AS Infected_percent
FROM [SQL portfolio]..CovidDeaths
GROUP BY location, population
ORDER BY 4 desc


