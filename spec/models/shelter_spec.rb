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
end
