require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the contestant's index page" do
    before :each do
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @project_1 = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      @project_2 = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
      
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @project_3 = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @project_4 = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      
      @contestant_1 = Contestant.create(name: "Kentaro Kameyama", age: 23, hometown: "Tulsa, OK", years_of_experience: 6)
      @contestant_2 = Contestant.create(name: "Jay McCarroll", age: 24, hometown: "Philadelphia, PA", years_of_experience: 8)
      
      ContestantProject.create(project_id: @project_1.id, contestant_id: @contestant_1.id)
      ContestantProject.create(project_id: @project_2.id, contestant_id: @contestant_1.id)
      ContestantProject.create(project_id: @project_3.id, contestant_id: @contestant_2.id)
      ContestantProject.create(project_id: @project_4.id, contestant_id: @contestant_2.id)
      
      visit "/contestants"
    end
    
    it "I see the contestant's name and projects" do
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_2.name)
      
      expect(page).to have_content(@contestant_2.name)
      expect(page).to have_content(@project_3.name)
      expect(page).to have_content(@project_4.name)
    end
  end
end