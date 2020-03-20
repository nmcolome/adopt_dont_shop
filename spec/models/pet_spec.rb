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
end
