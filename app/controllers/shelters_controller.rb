class SheltersController < ApplicationController
  before_action :find_shelter, only: [:show, :edit, :update, :destroy]

  def index
    @shelters = if params["sort"] == "pets"
                  Shelter.sort_by_adoptable_pets
                elsif params["sort"] == "abc"
                  Shelter.sort_by_name
                else
                  Shelter.all
                end
  end

  def show
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
  end

  def update
    if @shelter.update(shelter_params)
      redirect_to shelter_path(@shelter)
    else
      render :edit
    end
  end

  def destroy
    @shelter.destroy
    redirect_to shelters_path
  end

  private
    def shelter_params
      params.require(:shelter).permit(:name, :address, :city, :state, :zip)
    end

    def find_shelter
      @shelter = Shelter.find(params[:id])
    end
end
