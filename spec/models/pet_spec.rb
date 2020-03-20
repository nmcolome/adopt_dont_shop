require "rails_helper"

RSpec.describe Pet, type: :model do
  describe "attributes" do
    it { should respond_to :image }
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :approximate_age }
    it { should respond_to :sex }
    it { should respond_to :status }
  end

  describe "relationships" do
    it { should belong_to :shelter }
  end

  describe "enums" do
    it { should define_enum_for(:sex).with_values([:female, :male]) }
    it { should define_enum_for(:status).with_values([:adoptable, :pending]) }
  end

  describe "defaults" do
    it "should have a status of adoptable by default" do
      pet = create(:pet)

      expect(pet.status).to eq("adoptable")
    end
  end

  describe "validations" do
    it { should validate_presence_of(:image).with_message("Field required") }
    it { should validate_presence_of(:name).with_message("Field required") }
    it { should validate_presence_of(:description).with_message("Field required") }
    it { should validate_presence_of(:approximate_age).with_message("Field required") }
    it { should validate_presence_of(:sex).with_message("Field required") }
    it { should validate_presence_of(:shelter_id).with_message("Field required") }
  end
end
