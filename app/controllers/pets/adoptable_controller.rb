class Pets::AdoptableController < ApplicationController
  def update
    @pet = Pet.find(params["id"])
    @pet.update(status: "pending")
    redirect_to pet_path(@pet)
  end
end
