class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects
  
  def self.num_of_contestants
    binding.pry
    Project.first.contestants.count
  end
end
