class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find_by(id: params[:id])
  end

  def new
    @animal = Animal.new
  end
end
