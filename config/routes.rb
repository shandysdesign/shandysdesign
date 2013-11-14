Shandysdesign::Application.routes.draw do
  devise_for :users, :only => :sessions
  root 'welcome#index'
  resources 'items' do
    resources 'assets', :only => [:destroy,:update]
  end
end
