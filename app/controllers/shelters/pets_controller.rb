class Shelters::PetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end
end
