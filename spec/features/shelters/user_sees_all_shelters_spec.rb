require "rails_helper"

RSpec.describe "Shelter's index" do
  it "returns a list of all the shelters" do
    shelters = create_list(:shelter, 5)

    visit "/shelters"

    expect(page).to have_content(shelters[0].name)
  end

  context "User can sort shelters" do
    it "by number of adoptable pets" do
      shelters_a = create(:shelter, name: "ABC Shelter")
      pets_a = create_list(:pets, 3, shelter_id: shelters_a.id)
      shelters_z = create(:shelter, name: "Zootopia Shelter")
      pets_z = create_list(:pets, 5, shelter_id: shelters_z.id)
      shelter_p = create(:shelter, name: "Phoenix Shelter")
      pets_p = create_list(:pets, 8, shelter_id: shelters_p.id)

      visit shelters_path

      within ".container" do
        expect(page).to have_css("a.index-link:first-child", text: shelters_p.name)
        expect(page).to have_css("a.index-link:last-child", text: shelters_a.name)
      end
    end

    skip it "in alphabetical order" do
      shelters_a = create(:shelter, name: "ABC Shelter")
      pets_a = create_list(:pets, 3, shelter_id: shelters_a.id)
      shelters_z = create(:shelter, name: "Zootopia Shelter")
      pets_z = create_list(:pets, 5, shelter_id: shelters_z.id)
      shelter_p = create(:shelter, name: "Phoenix Shelter")
      pets_p = create_list(:pets, 8, shelter_id: shelters_p.id)

      visit shelters_path

      within ".container" do
        expect(page).to have_css("a.index-link:first-child", text: shelters_a.name)
        expect(page).to have_css("a.index-link:last-child", text: shelters_z.name)
      end
    end
  end
end
