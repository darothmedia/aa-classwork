require_relative './sqlzoo.rb'

# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

def sparse_continents
  # Find every country that belongs to a continent where    country's
  # population is less than 25,000,000. Show name, continent and
  # population.
  # Hint: Sometimes rewording the problem can help you see the solution.
  execute(<<-SQL)

  -- exclude continents that have countries with population > 25mil

  SELECT name, continent, population
  FROM countries
  WHERE continent IN (
    SELECT continent
    FROM countries
    GROUP BY continent
    HAVING MAX(population) < 25000000
  );

  -- alt approach
  -- check if continent is in subquery
  SELECT name, continent, population
  FROM countries
  WHERE continent NOT IN (
    SELECT continent
    FROM countries
    WHERE population >= 25000000
  );

  SQL
end

p sparse_continents