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

  def create
    @animal = Animal.new(
    name: params[:animal][:name],
    species: params[:animal][:species],
    age: params[:animal][:age]
    )

    if @animal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find_by(id: params[:id])
  end

  def update
    @animal = Animal.find_by(id: params[:id])

    result = @animal.update(
    name: params[:animal][:name],
    species: params[:animal][:species],
    age: params[:animal][:age]
    )

    if result
      redirect_to animal_path(@animal.id)
    else
      render :edit
    end
  end

  def delete
    animal = Animal.find_by(id: params[:id])

    if animal.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def animal_params
    return params.require(:animal).permit(:name, :species, :age)
  end
end
