Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "schools", to: "schools#index"
  get "school/:id", to: "schools#show"
  put "school/:id", to: "schools#update"
  post "school", to: "schools#create"
  delete "school/:id", to: "schools#destroy"

  get "students", to: "students#index"
  get "student/:id", to: "students#show"
  put "student/:id", to: "students#update"
  post "student", to: "students#create"
  delete "student/:id", to: "students#destroy"
  get "students/:search", to: "students#search"

  get "branches", to: "branches#index"
  get "branch/:id", to: "branches#show"
  put "branch/:id", to: "branches#update"
  post "branch", to: "branches#create"
  delete "branch/:id", to: "branches#destroy"
end
