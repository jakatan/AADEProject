Rails.application.routes.draw do

  resources :officer_pages

  resources :home_pages
  root 'home_pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :contact_forms
  resources :companies
  resources :alumnis
  resources :officers
  resources :positions
  resources :people
  resources :schedules

end