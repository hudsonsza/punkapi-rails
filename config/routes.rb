Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'beers/random',  to: 'beers#random'
  resources :beers

end
