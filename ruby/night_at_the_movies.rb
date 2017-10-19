require 'time'

class Movie
  attr_reader :name, :genre
  attr_accessor :start_time

  def initialize(movie_data)
    @name = movie_data[:name]
    @genre = movie_data[:genre]
    @start_time = Time.parse(movie_data[:start_time])
  end

  def showing_after?(time)
    if Time.parse(time) >= @start_time
      return true
    else
      return false
    end
  end

  def showing_between?(first_time, second_time)
    if Time.parse(first_time) < @start_time && Time.parse(second_time) > @start_time
      return true
    else
      return false
    end
  end

  def comedy?
    if @genre == "Comedy"
      return true
    else
      return false
    end
  end
end


list =
[{name: "The Princess Bride", genre: "Comedy", start_time: "7:00PM"},
{name: "Troll 2", genre: "Horror", start_time: "7:30PM"},
{name: "Pet Cemetery", genre: "Horror", start_time: "8:15PM"},
{name: "Flight of the Navigator", genre: "Adventure", start_time: "8:17PM"},
{name: "Teen Witch", genre: "Comedy", start_time: "8:20PM"},
{name: "The Goonies", genre: "Comedy", start_time: "8:30PM"},
{name: "Better Off Dead", genre: "Comedy", start_time: "8:45PM"},
{name: "Weekend at Bernies", genre: "Comedy", start_time: "9:00PM"},
{name: "The Wizard", genre: "Adventure", start_time: "9:10PM"}]

movie_list = []
list.each do |movie|
  movie_list << Movie.new(movie)
end

puts "The following movies are comedies:"
puts movie_list.select { |movie| movie.comedy? }

puts "-----------------------------------------"

time = "8:35 PM"
puts "The following movies are showing after #{time}:"
puts movie_list.select { |movie| movie.showing_after?(time) }

puts "-----------------------------------------"

time_1 = "7:25 PM"
time_2 = "8:35 PM"
puts "The following movies are showing between #{time_1}-#{time_2}:"
puts movie_list.select { |movie| movie.showing_between?(time_1, time_2) }
