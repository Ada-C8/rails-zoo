Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "animals#index"

  get "animals", to: "animals#index"

  get "animals/:id", to: "animals#show", as: "show"

end
