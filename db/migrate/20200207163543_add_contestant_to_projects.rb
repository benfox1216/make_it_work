class AddContestantToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :contestant, foreign_key: true
  end
end
