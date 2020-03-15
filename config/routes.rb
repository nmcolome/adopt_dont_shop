Rails.application.routes.draw do
  get "/shelters", to: "shelters#index"
  post "/shelters", to: "shelters#create"
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
end
