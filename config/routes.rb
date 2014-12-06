Rails.application.routes.draw do
  root 'api_client#index'

  get 'apiClient' => 'api_client#index'
end
