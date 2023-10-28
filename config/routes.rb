Rails.application.routes.draw do

  #管理者側ログイン
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admin/sessions',
  }

  #会員側登録、ログイン
  devise_for :customers, skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get '/home' => 'homes#home' , as: 'home'
    get '/customers/current_customer' => 'customers#show'
    get '/customers/current_customer/edit' => 'customers#edit'
    patch '/customers/current_customer' => 'customers#update'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :books, only: [:index, :show]
    resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end

  scope module: :admin do
    get '/admin' => "homes#top", as: 'admin'
  end

  namespace :admin do
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
  end

end
