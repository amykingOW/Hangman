Rails.application.routes.draw do
  root "games#index"

  resources :games, except: [:edit, :update] do
    resources :guesses, only: :create
  end

  match '*unmatched', to: 'application#not_found', via: :all
end
