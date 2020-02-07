require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the project's show page" do
    before :each do
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @project_1 = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      
      @contestant_1 = Contestant.create(name: "Kentaro Kameyama", age: 23, hometown: "Tulsa, OK", years_of_experience: 6)
      @contestant_2 = Contestant.create(name: "Jay McCarroll", age: 24, hometown: "Philadelphia, PA", years_of_experience: 8)
      
      ContestantProject.create(project_id: @project_1.id, contestant_id: @contestant_1.id)
      ContestantProject.create(project_id: @project_1.id, contestant_id: @contestant_2.id)
      
      visit "/challenges/#{@furniture_challenge.id}/projects/#{@project_1.id}"
    end
    
    it "I see the project's name, material, and theme" do
      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_1.material)
      expect(page).to have_content(@furniture_challenge.theme)
    end
    
    it "I see a count of the number of contestants on this project" do
      expect(page).to have_content("Number of Contestants: 2")
    end
  end
end