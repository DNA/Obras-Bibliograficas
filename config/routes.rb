Rails.application.routes.draw do
  root 'authors#index'

  resources :authors, only: %i[index destroy] do
    collection do
      get :load
      post :preview
      post :import
    end
  end
end
