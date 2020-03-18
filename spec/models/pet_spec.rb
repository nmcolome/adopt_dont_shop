require "rails_helper"

RSpec.describe Pet, type: :model do
  describe "attributes" do
    it { should respond_to :image }
    it { should respond_to :name }
    it { should respond_to :approximate_age }
    it { should respond_to :sex }
  end

  describe "relationships" do
    it { should belong_to :shelter }
  end
end
