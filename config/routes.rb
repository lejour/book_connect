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
    resources :books, only: [:index, :show]
    resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end
  end

end
