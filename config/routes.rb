Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
  get 'invitation_guest_list', to: 'pages#invitation_guest_list'
  get 'invitation_share_link', to: 'pages#invitation_share_link'
  resources :templates
  post 'invitations_choose_template', to: 'invitations#choose'
  resources :invitations do
    resources :guests
  end
  resources :invitations, path: '', as: 'custom_url_of_invitation', only: :show
end
