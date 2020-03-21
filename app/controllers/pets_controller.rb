class PetsController < ApplicationController
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
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private
    def pet_params
      params.require(:pet).permit(:image, :name, :description, :approximate_age, :sex)
    end
end
