Rails.application.routes.draw do
  # 管理者　ログイン
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ユーザ　新規登録・ログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # ゲストユーザ　ログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者
  namespace :admin do
    resources :users, except: [:new, :create, :destroy] do
      resources :posts, only: [:show, :index, :destroy]
      resources :comments, only: [:index, :destroy]
    end
  end

  # ユーザ
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, except: [:new, :create, :destroy] do
      # ユーザーの投稿一覧
      get 'posts' => 'users#posts'
      # いいね一覧
      get 'like_list' => 'likes#like_list'
      # 非公開記事一覧ページ
      get 'private_post' => 'posts#private_post'
    end
    # ユーザの退会確認ページ
    get 'user/unsubscribe' => 'users#unsubscribe'
    get 'user/withdraw' => 'users#withdraw'
    # キーワード検索結果ページ
    get 'search' => 'searches#search'
    # タグ検索結果ページ
    get 'post/tag/:name' => 'posts#tag'
    
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
  end
end