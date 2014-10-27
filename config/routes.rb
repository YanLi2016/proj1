Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/capture/:id', to: 'pokemon#capture', as: "capture"
  patch '/damage/:id', to: 'pokemon#damage', as: "damage"
  get '/pokemons/new', to: 'pokemon#new', as: "new_pokemon"
  post '/create', to: 'pokemon#create', as: "pokemons"
end
