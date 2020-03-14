require "rails_helper"

RSpec.describe Shelter, type: :model do
  describe "attributes" do
    it { should respond_to :id }
    it { should respond_to :name }
    it { should respond_to :address }
    it { should respond_to :city }
    it { should respond_to :state }
  end
end
