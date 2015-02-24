class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    form_data = params.require(:movie).permit(:title, :year)
    Movie.create form_data
    redirect_to movies_path, flash: { success: "Movie Added!" }
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
    @actor = Actor.all
    @movie.actors = @actor
    # @movie = Movie.all
  end

  def add_actor
    movie = Movie.find(params[:id])
    actor = Actor.find(params[:actor_id])
    movie.actors << actor
    redirect_to movie_path(movie)
  end
  def remove_actor
    movie = Movie.find(params[:id])
    actor = Actor.find(params[:actor_id])
    movie.actors.delete(actor)
    redirect_to movie_path(movie)
  end

  def update
    form_data = params.require(:movie).permit(:title, :year)
    movie = Movie.find(params[:id])
    movie.update_attributes form_data
    redirect_to movie_path(movie), flash: { notice: "Movie Updated!" }
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path, flash: { alert: "Movie Deleted!" }
  end
end
