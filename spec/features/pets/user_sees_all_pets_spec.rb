require "rails_helper"

RSpec.describe "Pets Index" do
  it "user sees all information related to each pet" do
    shelter = create(:shelter)
    pets = create_list(:pet, 5, shelter_id: shelter.id)

    visit pets_path

    expect(page).to have_content(pets[0].name)
    expect(page).to have_content(pets[4].name)
    expect(page).to have_css("div.pet-card", count: 5)
    expect(page).to have_css("img[src*='placedog.net']", count: 5)
    expect(page).to have_content(pets[0].approximate_age)
    expect(page).to have_content(pets[0].sex)
    expect(page).to have_content(shelter.name, count: 5)
  end
end
