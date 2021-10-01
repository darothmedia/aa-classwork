def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.

  Movie.select(:id, :title, :yr, :score)
    .where('yr BETWEEN 1980 AND 1989 AND score BETWEEN 3 AND 5')

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  over_8= Movie.select(:yr)
  .where('score >8')
  .distinct

  Movie
  .where.not('yr': over_8)
  .distinct
  .pluck(:yr)

end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Movie.joins(:actors)
  .select('actors.id', 'actors.name')
  .order('castings.ord')
  .where('movies.title': title)

end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.

end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

end
