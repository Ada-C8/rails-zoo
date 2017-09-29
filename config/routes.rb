Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "animals#index"

  get "animals", to: "animals#index"

  get "animals/new", to: "animals#new", as: "new"
  post "animals", to: "animals#create", as: "create"

  get "animals/:id", to: "animals#show", as: "animal"

  get "animals/:id/edit", to: "animals#edit", as: "edit_animal"
  patch "animals/:id", to: "animals#update", as: "update_animal"

  delete "animals/:id", to: "animals#delete", as: "delete_animal"

end
