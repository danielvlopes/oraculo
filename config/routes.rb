Oraculo::Application.routes.draw do
  devise_for :users

  resources :questions do
    resources :answers
  end

  resources :answers
  resources :abusive_answers, :only => :create

  root to: "questions#index"
end

