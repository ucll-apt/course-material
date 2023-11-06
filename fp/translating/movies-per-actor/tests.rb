require_relative './solution.rb'


# Defines a type with fields "title" and "actors"
Movie = Struct.new :title, :actors


def imperative(movies)
  result = Hash.new(0)

  i = 0
  while i < movies.size
    current_movie = movies[i]
    current_actors = current_movie.actors

    j = 0
    while j < current_actors.size
      current_actor = current_actors[j]
      result[current_actor] += 1
      j += 1
    end

    i += 1
  end

  result
end



def assert(condition, message)
  abort message unless condition
end


def check(movies)
  puts "Testing on #{movies}"
  expected = imperative(movies)
  actual = functional(movies)

  assert(expected == actual, "Wrong result: expected #{expected.inspect}, got #{actual.inspect}")
end


check([])

check([Movie.new('Buried', [ 'Ryan Reynolds' ])])

check([
  Movie.new('Buried', [ 'Ryan Reynolds' ]),
  Movie.new('Deadpool', [ 'Ryan Reynolds' ]),
])

check([
  Movie.new('Buried', [ 'Ryan Reynolds' ]),
  Movie.new('Deadpool', [ 'Ryan Reynolds' ]),
  Movie.new("The Hitman's Bodyguard", [ 'Ryan Reynolds', 'Samuel L. Jackson', 'Gary Oldman' ]),
  Movie.new("Pulp Fiction", [ 'John Travolta', 'Samuel L. Jackson', 'Bruce Willis' ]),
])

check([
  Movie.new('Buried', [ 'Ryan Reynolds' ]),
  Movie.new('Deadpool', [ 'Ryan Reynolds' ]),
  Movie.new("The Hitman's Bodyguard", [ 'Ryan Reynolds', 'Samuel L. Jackson', 'Gary Oldman' ]),
  Movie.new("Pulp Fiction", [ 'John Travolta', 'Samuel L. Jackson', 'Bruce Willis' ]),
  Movie.new("Red", [ 'Bruce Willis' ]),
  Movie.new("True Romance", [ 'Gary Oldman', 'Brad Pitt', 'Val Kilmer', 'Christian Slater', 'Michael Madsen', 'Dennis Hopper', 'Christopher Walken', 'Samuel L. Jackson', 'James Gandolfini' ]),
])

puts 'Success'
