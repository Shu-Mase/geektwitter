Rails.application.routes.draw do
    root 'hello#index'

    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users, only: [:show] #追記 ユーザーマイページへのルーティング
    
    #変更後
    resources :tweets do
        resources :likes, only: [:create, :destroy]
        #追記箇所
        resources :comments, only: [:create]
        #ここまで
    end

end