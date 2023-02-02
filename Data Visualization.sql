/*
Queries used for Tableau Visualization
*/



-- 1. Global Numbers

SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/SUM(New_Cases)*100 AS DeathPercentage
FROM Covid19Data..CovidDeaths
--Where location = 'India'
WHERE continent is not null 
--Group By date
ORDER BY 1,2



--SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/SUM(New_Cases)*100 AS DeathPercentage
--FROM PortfolioProject..CovidDeaths
----WHERE location = 'India'
--WHERE location = 'World'
----GROUP BY date
--ORDER BY 1,2


-- 2. Total Deaths Per Continent

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

SELECT location, SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
FROM Covid19Data..CovidDeaths
--WHERE location = 'India'
WHERE continent IS NULL
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC


-- 3. Percent Population Infected Per Country

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM Covid19Data..CovidDeaths
--Where location = 'India'
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC


-- 4. Percent Population Infected


SELECT Location, Population,date, MAX(total_cases) AS HighestInfectionCount,  MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM Covid19Data..CovidDeaths
--Where location = 'India'
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC













