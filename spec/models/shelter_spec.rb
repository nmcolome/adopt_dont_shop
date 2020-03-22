require "rails_helper"

RSpec.describe Shelter, type: :model do
  describe "attributes" do
    it { should respond_to :id }
    it { should respond_to :name }
    it { should respond_to :address }
    it { should respond_to :city }
    it { should respond_to :state }
    it { should respond_to :zip }
  end

  describe "validations" do
    it { should validate_presence_of(:name).with_message('Field required') }
    it { should validate_presence_of(:address).with_message('Field required') }
    it { should validate_presence_of(:city).with_message('Field required') }
    it { should validate_presence_of(:state).with_message('Field required') }
    it { should validate_presence_of(:zip).with_message('Field required') }
  end

  describe "relationships" do
    it { should have_many :pets }
  end

  describe "methods" do
    before(:each) do
      @shelter_a = create(:shelter, name: "ABC Shelter")
      pets_a = create_list(:pet, 3, shelter_id: @shelter_a.id)
      @shelter_z = create(:shelter, name: "Zootopia Shelter")
      pets_z = create_list(:pet, 5, shelter_id: @shelter_z.id)
      @shelter_p = create(:shelter, name: "Phoenix Shelter")
      pets_p = create_list(:pet, 8, shelter_id: @shelter_p.id)
    end

    it "#sort_by_adoptable_pets" do
      expect(Shelter.sort_by_adoptable_pets).to eq([@shelter_p, @shelter_z, @shelter_a])
    end

    it "#sort_by_name" do
      expect(Shelter.sort_by_name).to eq([@shelter_a, @shelter_p, @shelter_z])
    end
  end
end
