Shandysdesign::Application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources 'items'

end
