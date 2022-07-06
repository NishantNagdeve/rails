Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students
      get 'search' => 'students#search'
    end
  end
end
