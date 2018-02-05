class MoviesController < ApplicationController

  def index
    @director = Director.find(params[:director_id])
    # @movies = Movie.where(director_id: @director.id) instead use below
    @movies = @director.movies
  end

  def new
    @director = Director.find(params[:director_id])
    # @movie = Movie.new instead use below
    @movie = @director.movies.new
  end

  def create
    @director = Director.find(params[:director_id])
    @movie = @director.movies.new(movie_params)
    if @movie.save
      redirect_to director_movies_path(@director)
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
    # why not permit director_id? cause you can create a movie directly on the director
  end

end
