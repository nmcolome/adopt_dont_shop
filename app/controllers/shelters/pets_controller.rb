class Shelters::PetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
    @pet = @shelter.pets.new
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    @pet = @shelter.pets.new(pet_params)

    if @pet.save
      redirect_to shelter_pets_path(@shelter)
    else
      # TODO: sad path
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:image, :name, :description, :approximate_age, :sex)
    end
end
