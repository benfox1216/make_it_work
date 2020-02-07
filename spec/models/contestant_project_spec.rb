require 'rails_helper'

RSpec.describe ContestantProject, type: :model do
  describe "relationships" do
    it {should belong_to :contestant}
    it {should belong_to :project}
  end
  
  describe "methods" do
    describe '#contestants_in_project' do
      it 'can return number of contestants in project' do
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        @project_1 = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
        
        @contestant_1 = Contestant.create(name: "Kentaro Kameyama", age: 23, hometown: "Tulsa, OK", years_of_experience: 6)
        @contestant_2 = Contestant.create(name: "Jay McCarroll", age: 24, hometown: "Philadelphia, PA", years_of_experience: 8)
        
        ContestantProject.create(project_id: @project_1.id, contestant_id: @contestant_1.id)
        ContestantProject.create(project_id: @project_1.id, contestant_id: @contestant_2.id)
        
        expect(ContestantProject.contestants_in_project(@project_1.id)).to eq(2)
      end
    end
  end
end
