Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy] # ここを追加
  end

  scope module: :public do
    devise_for :users
    root to: "homes#top"
    get 'homes/about', to: 'homes#about', as: :about
    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
