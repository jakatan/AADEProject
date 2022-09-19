Rails.application.routes.draw do
  resources :contact_forms
  resources :companies
  resources :alumnis
  resources :officers
  resources :positions
  resources :people
  root 'officers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
