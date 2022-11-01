Rails.application.routes.draw do
  devise_for :people, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }

  devise_scope :person do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_person_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_person_session
  end

  get 'officer_page', action: :index, controller: 'officer_pages'
  get 'admins', action: :index, controller: :admins
  resources :officer_pages
  resources :home_pages
  resources :contact_forms
  resources :companies
  resources :alumnis
  resources :officers
  resources :positions
  resources :people
  resources :schedules

  root 'home_pages#index'
end
