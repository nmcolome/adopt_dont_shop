require "rails_helper"

RSpec.describe "Pet Show" do
  it "shows information related to a specific pet" do
    pet = create(:pet)

    visit pet_path(pet)

    expect(page).to have_content(pet.name)
    expect(page).to have_css("img[src*='placedog.net']")
    expect(page).to have_content(pet.description)
    expect(page).to have_content(pet.approximate_age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.status)
  end
end
