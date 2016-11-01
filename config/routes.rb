Rails.application.routes.draw do
  resources :dummies
  devise_for :agents
  resources :agent_websites
end
