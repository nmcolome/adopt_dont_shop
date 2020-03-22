require "rails_helper"

RSpec.describe "Shelter's index" do
  it "returns a list of all the shelters" do
    shelters = create_list(:shelter, 5)

    visit "/shelters"

    expect(page).to have_content(shelters[0].name)
  end

  context "User can sort shelters" do
    before(:each) do
      @shelter_a = create(:shelter, name: "ABC Shelter")
      pets_a = create_list(:pet, 3, shelter_id: @shelter_a.id)
      @shelter_z = create(:shelter, name: "Zootopia Shelter")
      pets_z = create_list(:pet, 5, shelter_id: @shelter_z.id)
      @shelter_p = create(:shelter, name: "Phoenix Shelter")
      pets_p = create_list(:pet, 8, shelter_id: @shelter_p.id)
    end

    it "by number of adoptable pets" do
      visit shelters_path
      click_on "Sort by Total Adoptable Pets"

      within ".container" do
        expect(page).to have_css("a.index-link:first-child", text: @shelter_p.name)
        expect(page).to have_css("a.index-link:last-child", text: @shelter_a.name)
      end
    end

    it "in alphabetical order" do
      visit shelters_path
      click_on "Sort in Alphabetical Order"

      within ".container" do
        expect(page).to have_css("a.index-link:first-child", text: @shelter_a.name)
        expect(page).to have_css("a.index-link:last-child", text: @shelter_z.name)
      end
    end
  end
end
