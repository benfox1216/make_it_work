class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
    @challenge = Challenge.find(params[:challenge_id])
  end
end