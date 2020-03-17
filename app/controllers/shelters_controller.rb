class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)

    if @shelter.save
      redirect_to shelters_path
    else
      render :new
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.find(params[:id])
    @shelter.update(shelter_params)
    redirect_to shelter_path(@shelter)
  end

  private
    def shelter_params
      params.require(:shelter).permit(:name, :address, :city, :state, :zip)
    end
end
