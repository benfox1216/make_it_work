Rails.application.routes.draw do
  #projects
  get '/challenges/:challenge_id/projects/:project_id', to: 'projects#show'
  
  #contestants
  get '/contestants', to: 'contestants#index'
end