require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
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
