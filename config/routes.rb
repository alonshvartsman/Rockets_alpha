Rails.application.routes.draw do
  get 'dashboards/index'
  get 'spaceships/new'
  get 'spaceships/index'
  get 'spaceships/create'
  get 'spaceships/show'
  get 'spaceships/edit'
  get 'spaceships/update'
  get 'spaceships/delete'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
