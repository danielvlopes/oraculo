Oraculo::Application.routes.draw do
  root to: "questions#index"
  resources :questions
end
