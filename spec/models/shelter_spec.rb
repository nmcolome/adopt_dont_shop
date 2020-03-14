require "rails_helper"

RSpec.describe Shelter, type: :model do
  describe "attributes" do
    it { should respond_to :name }
  end
end
