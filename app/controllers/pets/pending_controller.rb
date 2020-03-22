class Pets::PendingController < ApplicationController
  def update
    @pet = Pet.find(params["id"])
    @pet.update(status: "adoptable")
    redirect_to pet_path(@pet)
  end
end
