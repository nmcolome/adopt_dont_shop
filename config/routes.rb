Rails.application.routes.draw do
  root to: "shelters#index"
  get "/shelters", to: "shelters#index"
  post "/shelters", to: "shelters#create"
  get "/shelters/new", to: "shelters#new", as: "new_shelter"
  get "/shelters/:id/edit", to: "shelters#edit", as: "edit_shelter"
  get "/shelters/:id", to: "shelters#show", as: "shelter"
  patch "/shelters/:id", to: "shelters#update"
  delete "/shelters/:id", to: "shelters#destroy"
  get "/pets", to: "pets#index"
  get "/shelters/:shelter_id/pets", to: "shelters/pets#index"
end
