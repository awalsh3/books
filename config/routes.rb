# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #
  namespace 'api' do
    namespace 'v1' do
      resources :books, only: [:index]
    end
  end
end
