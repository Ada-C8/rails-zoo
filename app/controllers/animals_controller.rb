class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find_by(id: params[:id])
    redirect_to root_path unless @animal
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(
    name: params[:animal][:name],
    species: params[:animal][:species],
    age: params[:animal][:age]
    )

    @animal.save ? (redirect_to root_path) : (render :new)
  end

  def edit
    @animal = Animal.find_by(id: params[:id])
  end

  def update
    @animal = Animal.find_by(id: params[:id])
    redirect_to root_path unless @animal

    @animal.update_attributes(animal_params) ? (redirect_to root_path) : (render :edit)
  end

  def delete
    animal = Animal.find_by(id: params[:id])

    animal.destroy ? (redirect_to root_path) : (render :show)
  end

  private

  def animal_params
    return params.require(:animal).permit(:name, :species, :age)
  end
end
