require 'dotenv'
require 'themoviedb'
class SearchMovie 
 def initialize(movie)
    @search = Tmdb::Search.new
    Tmdb::Api.key("d9f8e7b2d0bf04912719c8a614d4efe2")
    Tmdb::Api.language("fr")
    @search.resource('movie') # determines type of resource
    @search.query(movie) # the query to search against
    @result = @search.fetch # makes request
    puts @result[19]
    puts @result.size
  end


  def perform
    @info = []
    i = 0
    configuration = Tmdb::Configuration.new
    while i < 20 do
      if @result[i]
        h = {}
        h[:id] = @result[i]["id"]
        h[:title] = @result[i]["title"]
        h[:release_date] = @result[i]["release_date"]
        h[:image] = "#{configuration.base_url}/w45#{@result[i]["poster_path"]}"
        h[:director] = Tmdb::Movie.crew(@result[i]["id"])[0]["name"]
        @info << h
      end
      i += 1
    end
    puts @info
    return @info
  end
end 