Rails.application.routes.draw do
  get 'api/upload'

  # Root path
  root 'api_client#index'

  # Devise paths
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  # API client
  get 'apiClient' => 'api_client#index'
end
