class DirectorsController < ApplicationController

  def show
    @director = Director.find(params[:id])
    session[:secret] = "This time for real though"
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to director_path(@director)
    else
      render :new # this is not a redirect
      # showing a new view but path is from directors
      # when you redirect you send a response and get another request
      # whereas with render :new its just one initial response
    end
  end

  private

    def director_params
      params.require(:director).permit(:name)
    end

end
