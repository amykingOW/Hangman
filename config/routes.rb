Rails.application.routes.draw do
  root "games#index"

  # exclude routes that don't have a view
  resources :games, except: [:edit, :update] do
    resources :guesses, only: :create
  end

  match '*unmatched', to: 'application#not_found', via: :all
end
