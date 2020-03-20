require "rails_helper"

RSpec.describe "Shelter's index" do
  it "returns a list of all the shelters" do
    shelters = create_list(:shelter, 5)

    visit "/shelters"

    expect(page).to have_content(shelters[0].name)
  end
end
