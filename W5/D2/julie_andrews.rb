require_relative './sqlzoo.rb'

# == Schema Information
#
# Table name: actors
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

def flex_time
  execute(<<-SQL)
  -- what is Julie Andrews' id?

  -- what are the movies that julie andrews played in?
  -- what are the title and lead actors for those movies?
  SELECT movies.title, actors.name
  FROM movies
  JOIN castings ON movies.id = castings.movie_id
  JOIN actors ON actors.id = castings.actor_id
  WHERE movies.id IN (
    SELECT movie_id
    FROM castings
    WHERE actor_id = (
      SELECT id
      FROM actors
      WHERE name = 'Julie Andrews'
      )
  ) AND castings.ord = 1;
  SQL
end


def julie_andrews_subquery
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)

  SELECT movies.title, actors.name
  FROM movies
  JOIN castings ON castings.movie_id = movies.id
  JOIN actors ON castings.actor_id = actors.id
  WHERE castings.ord = 1 AND movies.title IN (
    SELECT movies.title
    FROM movies
    JOIN castings ON castings.movie_id = movies.id
    JOIN actors ON castings.actor_id = actors.id
    WHERE actors.name = 'Julie Andrews'
  )

  SQL
end

def julie_andrews_joins
  execute(<<-SQL)

  SELECT *
  FROM movies

  JOIN castings AS lead_castings ON lead_castings.movie_id = movies.id
  JOIN actors AS lead_actors ON lead_castings.actor_id = lead_actors.id

  JOIN castings AS julie_castings ON julie_castings.movie_id = movies.id
  JOIN actors AS julie_actors ON julie_castings.actor_id = julie_actors.id

  WHERE lead_castings.ord = 1 AND julie_actors.name = 'Julie Andrews'

  SQL
end




p julie_andrews_subquery
p julie_andrews_joins







# for pretty output, paste into database:

# SELECT title, yr, lead_castings.actor_id AS lead_casting_actor_id, lead_castings.ord AS lead_casting_ord, lead_actors.id AS lead_actor_id, lead_actors.name AS lead_actor_name, julie_castings.actor_id AS julie_casting_actor_id, julie_castings.ord AS julie_casting_ord, julie_actors.id AS julie_actor_id, julie_actors.name AS julie_actor_name
# FROM movies
# JOIN castings AS lead_castings ON movies.id = lead_castings.movie_id
# JOIN actors AS lead_actors ON lead_castings.actor_id = lead_actors.id
# JOIN castings AS julie_castings ON movies.id = julie_castings.movie_id
# JOIN actors AS julie_actors ON julie_castings.actor_id = julie_actors.id
# WHERE lead_castings.ord = 1 AND julie_actors.name = 'Julie Andrews';