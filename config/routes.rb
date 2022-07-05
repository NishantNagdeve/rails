Rails.application.routes.draw do
  resources :students
  get 'search' => 'students#search'
end
