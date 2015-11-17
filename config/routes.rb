Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations" }

  root "posts#all"

  resources :users, only: [] do
    resources :posts
  end

  resources :comments, only: [:create]

end
