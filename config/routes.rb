Rails.application.routes.draw do

  resources :students, :lessons

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to:"students#index"

  get "/students/:id/teach_lesson", to:"students#add"
  patch "/students/:id/teach_lesson", to:"students#teach"
end
