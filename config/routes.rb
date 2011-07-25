Oraculo::Application.routes.draw do

  resources :members, only:[:index]

  devise_for :users

  resources :questions do
    resources :answers
  end

  resources :messages

  root to: "questions#index"
end

