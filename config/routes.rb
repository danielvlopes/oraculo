Oraculo::Application.routes.draw do
  devise_for :users

  resources :questions do
    resources :answers
  end

  root to: "questions#index"
end
