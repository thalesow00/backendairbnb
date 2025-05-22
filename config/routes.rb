Rails.application.routes.draw do
  get 'gossips/new'
  get 'gossips/create'
   root to: 'pages#home'          # page d'accueil
  get 'pages/team'
  get 'pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'
  get 'welcome/:first_name', to: 'pages#welcome', as: 'welcome'

  resources :potins, only: [:new, :create] # Ajout des routes pour les potins

  resources :gossips, only: [:new, :create] # Routes REST pour les potins
end
