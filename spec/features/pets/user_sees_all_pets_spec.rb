require "rails_helper"

RSpec.describe "Pets Index" do
  before :each do
    @shelter = create(:shelter)
    @last_pet = create(:pet, name: "Rocky", status: "pending")
    @pets = create_list(:pet, 5, shelter_id: @shelter.id)
  end

  it "user sees all information related to each pet" do
    visit pets_path

    expect(page).to have_content(@pets[0].name)
    expect(page).to have_content(@pets[4].name)
    expect(page).to have_css("div.pet-card", count: 6)
    expect(page).to have_css("img[src*='placedog.net']", count: 6)
    expect(page).to have_content(@pets[0].approximate_age)
    expect(page).to have_content(@pets[0].sex)
    expect(page).to have_content(@shelter.name, count: 5)
  end

  context "Pet Filter by Adoptable Status" do
    it "user selects to show only adoptable pets" do
      visit pets_path

      click_on "Only Adoptable Pets"

      expect(current_url).to eq(pets_url(adoptable: "true"))
      expect(page).to have_content(@pets[0].name)
      expect(page).to have_css("div.pet-card", count: 5)
      expect(page).to_not have_content(@last_pet.name)
    end

    it "user selects to show only adoption-pending pets" do
      visit pets_path

      click_on "Only Adoption-Pending Pets"

      expect(current_url).to eq(pets_url(adoptable: "false"))
      expect(page).to have_content(@last_pet.name)
      expect(page).to_not have_content(@pets[0].name)
      expect(page).to have_css("div.pet-card", count: 1)
    end

    it "user selects to show all pets within that shelter" do
      visit pets_path

      click_on "All Pets in Shelter"

      expect(page).to have_content(@last_pet.name)
      expect(page).to have_content(@pets[4].name)
      expect(page).to have_css("div.pet-card", count: 6)
    end
  end
end
