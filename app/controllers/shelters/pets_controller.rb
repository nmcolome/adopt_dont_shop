class Shelters::PetsController < ApplicationController
  before_action :set_shelter

  def index
    @pets = if params["adoptable"] == "true"
            @shelter.pets.where(status:"adoptable")
          elsif params["adoptable"] == "false"
            @shelter.pets.where(status:"pending")
          else
            @shelter.pets
          end
  end

  def new
    @pet = @shelter.pets.new
  end

  def create
    @pet = @shelter.pets.new(pet_params)

    if @pet.save
      redirect_to shelter_pets_path(@shelter)
    else
      render :new
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:image, :name, :description, :approximate_age, :sex)
    end

    def set_shelter
      @shelter = Shelter.find(params[:shelter_id])
    end
end
