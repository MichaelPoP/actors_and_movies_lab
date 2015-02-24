class LandpageController < ApplicationController
  def index
     @actors = Actor.all
     @movies = Movie.all
  end
end
