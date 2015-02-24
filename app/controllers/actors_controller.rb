class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def create
    form_data = params.require(:actor).permit(:name)
    Actor.create form_data
    redirect_to actors_path, flash: { success: "Actor Created!" }
  end

  def new
    @actor = Actor.new
  end

  def edit
    @actor = Actor.find(params[:id])
   
  end

  def show
    @actor = Actor.find(params[:id])
    @movie = Movie.all
    @movie = @actor.movies
    @actor = Actor.all
    @actor = @movie.actors
  end

  def add_actor
    @movie = Movie.find(params[:id][:movie_id])
      if @actor.save
        @movie.actors << @actor
      else
        render :show
      end
  end

  def update
    form_data = params.require(:actor).permit(:name)
    actor = Actor.find(params[:id])
    actor.update_attributes form_data
    redirect_to actor_path(actor), flash: { notice: "Actor updated!" }
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.destroy
    redirect_to actors_path, flash: { alert: "Post Updated!" }
  end
end
