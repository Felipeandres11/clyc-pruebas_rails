Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'application#hello'

    get '/statistics', to: "causes#statistics"
    resources :causes, only:[:index, :show, :update, :create]
    resources :donations, only:[:create, :index, :destroy]
end
