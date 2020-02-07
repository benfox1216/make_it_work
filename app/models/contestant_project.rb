class ContestantProject <ApplicationRecord
  belongs_to :contestant
  belongs_to :project
  
  def self.contestants_in_project(project_id)
    self.select(project_id).count
  end
end
