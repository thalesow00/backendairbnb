Rails.application.routes.draw do
   root to: 'pages#home'          # page d'accueil
  get 'pages/team'
  get 'pages/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'
  get 'welcome/:first_name', to: 'pages#welcome', as: 'welcome'
end

 