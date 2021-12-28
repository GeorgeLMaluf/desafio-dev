# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :providers, only: [:index]
      resources :transactions, only: [:index]
      
      get 'transactions/by_provider/:providerId', to: 'transactions#by_provider'
      post 'import_file', to: 'import#import_file'
    end
  end
end
