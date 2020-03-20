require "rails_helper"

RSpec.describe "Shelter Pets Index" do
  it "User sees each pet from that shelter" do
    shelter = create(:shelter)
    pets = create_list(:pet, 5, shelter_id: shelter.id)

    visit "/shelters/#{shelter.id}/pets"

    expect(page).to have_content(shelter.name)
    expect(page).to have_content(pets[0].name)
    expect(page).to have_content(pets[4].name)
    expect(page).to have_css("div.pet-card", count: 5)
    expect(page).to have_css("img[src*='placedog.net']", count: 5)
    expect(page).to have_content(pets[3].approximate_age)
    expect(page).to have_content("male", count: 5)
  end
end
