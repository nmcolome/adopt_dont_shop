require "rails_helper"

RSpec.describe "Shelter Pets Index" do
  before :each do
    @shelter = create(:shelter)
    @last_pet = create(:pet, shelter_id: @shelter.id, status: "pending")
    @pets = create_list(:pet, 5, shelter_id: @shelter.id)
  end

  it "User sees each pet from that shelter" do
    visit shelter_pets_path(@shelter)

    expect(page).to have_content(@shelter.name)
    expect(page).to have_content(@pets[0].name)
    expect(page).to have_content(@pets[4].name)
    expect(page).to have_css("div.pet-card", count: 6)
    expect(page).to have_css("img[src*='placedog.net']", count: 6)
    expect(page).to have_content(@pets[3].approximate_age)
    expect(page).to have_content("male", count: 6)
  end

  context "nav links" do
    it "user links from shelter show page" do
      visit shelter_path(@shelter)

      click_on "See Pets"

      expect(current_path).to eq(shelter_pets_path(@shelter))
      expect(page).to have_content(@pets[0].name)
      expect(page).to have_content(@pets[4].name)
    end
  end

  it "User sees pet count" do
    visit shelter_pets_path(@shelter)

    expect(page).to have_content("Number of pets in #{@shelter.name}: 6")
  end

  it "Adoptable Pets Display First" do
    visit shelter_pets_path(@shelter)

    within ".pet-container" do
      expect(page).to have_css("a.pet-link:first-child", text: @pets[0].name)
      expect(page).to have_css("a.pet-link:last-child", text: @last_pet.name)
    end
  end
end
