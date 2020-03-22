class PetsController < ApplicationController
  before_action :set_pet, except: [:index]

  def index
    @pets = if params["adoptable"] == "true"
      Pet.where(status:"adoptable")
    elsif params["adoptable"] == "false"
      Pet.where(status:"pending")
    else
      Pet.all
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private
    def pet_params
      params.require(:pet).permit(:image, :name, :description, :approximate_age, :sex)
    end

    def set_pet
      @pet = Pet.find(params[:id])
    end
end
