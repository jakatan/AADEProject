Rails.application.routes.draw do

  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }

  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
    get 'admins', to: 'admins#index'
  end
  get 'officer_page', action: :index, controller: 'officer_pages'

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

