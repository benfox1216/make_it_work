require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the project's show page" do
    before :each do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      
      visit '/challenges/:challenge_id/projects/:project_id'
    end
    
    it "I see the project's name, material, and theme" do
      
    end
  end
end