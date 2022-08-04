Rails.application.routes.draw do
  # 管理者(devise) ログインのみ
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ユーザ(devise)　新規登録・ログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # 管理者
  namespace :admin do
    resources :users, except: [:new, :create, :destroy]
  end

  # ユーザ
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, except: [:new, :create, :destroy]
    resources :posts do
      resource :likes, only: [:create, :destroy]
    end

    # ユーザの退会確認ページ
    get 'unsubscribe' => 'users#unsubscribe'

    #　ユーザ・投稿の検索結果ページ
    get 'users/search' => 'users#search'
    get 'posts/search' => 'posts#search'
  end
end