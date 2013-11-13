Shandysdesign::Application.routes.draw do
  devise_for :users, :only => :sessions
  root 'welcome#index'
  resources 'items'

end
