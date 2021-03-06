Rails.application.routes.draw do

  root 'tests#index'
  
  resources :tests do
    resources :questions, shallow:true, except: :index do
      resources :answers, shallow: true
    end

    member do 
      post :start
    end
  end
  

  resources :test_passages, only: %i[show update] do 
    member do
      get :result
    end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end