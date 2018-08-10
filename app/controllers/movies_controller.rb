class MoviesController < ApplicationController
   def search
    if params[:movie]
      @info = SearchMovie.new(params[:movie]).perform
    end
  end
end
