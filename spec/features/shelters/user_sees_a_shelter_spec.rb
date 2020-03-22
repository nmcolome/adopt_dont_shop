require "rails_helper"

RSpec.describe "Shelter's show page" do
  it "returns information related to a specific shelter" do
    shelter = create(:shelter)

    visit shelter_path(shelter)

    expect(page).to have_content(shelter.name)
    expect(page).to have_content(shelter.address)
    expect(page).to have_content(shelter.city)
    expect(page).to have_content(shelter.state)
    expect(page).to have_content(shelter.zip)
  end
end
