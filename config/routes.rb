Oraculo::Application.routes.draw do
  devise_for :users

  root to: "questions#index"
  resources :questions
end
