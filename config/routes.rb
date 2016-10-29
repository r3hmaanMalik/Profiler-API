Rails.application.routes.draw do
  devise_for :agents
  resources :agent_websites
end
