def functional(movies)
  movies.flat_map { |movie| movie.actors }
        .uniq
        .map { |actor| [actor, movies.count { |movie| movie.actors.include? actor }] }
        .to_h
end