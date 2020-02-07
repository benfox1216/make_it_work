require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the project's show page" do
    before :each do
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @project_1 = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      
      visit "/challenges/#{@furniture_challenge.id}/projects/#{@project_1.id}"
    end
    
    it "I see the project's name, material, and theme" do
      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_1.material)
      expect(page).to have_content(@furniture_challenge.theme)
    end
  end
end