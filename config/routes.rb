Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "students#index"
  #Student
  get "/students" => "students#index"
  get "/students/:id" => "students#show", as: :student
  get "/student/new" => "students#new", as: :new_student
  get "/students/:id/edit" => "students#edit", as: :edit_student
  patch "/students/:id", to: "students#update"
  post "/students" => "students#create"
  delete "/students/:id", to: "students#delete", as: :destroy_student

  #Course
  resources :courses

  #Teacher
  get "/teachers" => "teacher#index"
  get "/teachers/:id" => "teacher#show", as: :teacher
  get "/teacher/new" => "teacher#new", as: :new_teacher
  get "/teachers/:id/edit" => "teacher#edit" , as: :edit_teacher
  patch "/teachers/:id" ,  to: "teacher#update"
  post "/teachers" => "teacher#create"
  delete "/teachers/:id" , to: "teacher#delete", as: :destroy_teacher




  # Defines the root path route ("/")
  # root "posts#index"
end
