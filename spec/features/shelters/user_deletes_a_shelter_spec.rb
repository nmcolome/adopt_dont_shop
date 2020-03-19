require "rails_helper"

RSpec.describe "Shelter deletion" do
  describe "user links from a shelter's show page" do
    it "redirects them to the shelter index page" do
      shelter = create(:shelter)
      names = create_list(:shelter, 5).pluck(:name)

      visit shelter_path(shelter)

      click_on "Delete Shelter"

      expect(current_path).to eq(shelters_path)
      expect(page).to_not have_content(shelter.name)
      names.each { |name| expect(page).to have_content(name) }
    end
  end
end
