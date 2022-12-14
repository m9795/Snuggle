# frozen_string_literal: true

Rails.application.routes.draw do
  # 管理者　ログイン
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ユーザ　新規登録・ログイン
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # ゲストユーザ　ログイン
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # 管理者
  namespace :admin do
    resources :users, except: [:new, :create, :destroy] do
      resources :posts, only: [:show, :index, :destroy]
      resources :comments, only: [:index, :destroy]
    end
    resources :shop_tags, only: [:new, :create, :edit, :update, :destroy]
    resources :news, only: [:index, :create, :edit, :update, :destroy]
  end

  # ユーザ
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    get "news" => "homes#news"
    resources :users, except: [:new, :create, :destroy] do
      # フォーロー機能
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
      # ユーザーの投稿一覧
      get "posts" => "users#posts"
      # いいね一覧
      get "like_list" => "likes#like_list"
      # 非公開記事一覧ページ
      get "private_post" => "posts#private_post"
      # ひとりごと投稿機能
      resources :own_posts, only: [:new, :create, :index, :destroy]
      # ユーザ詳細紹介ページ
      get "detail" => "users#detail"
      # お問い合わせ機能
      get  "inquiry" => "inquiry#index"
      post "inquiry/confirm"
      post "inquiry/thanks"
      # フォローユーザーの投稿一覧
      get "followings_posts"
      # チャットルーム一覧
      get "chat_rooms"
    end
    # ユーザの退会確認ページ
    get "user/unsubscribe" => "users#unsubscribe"
    get "user/withdraw" => "users#withdraw"

    # ユーザ検索結果ページ
    get "user_search" => "searches#user_search"
    # キーワード検索結果ページ
    get "search" => "searches#search"
    # タグ検索結果ページ
    get "post/tag/:name" => "posts#tag"
    # 店舗施設のタグ検索結果ページ
    get "post/shop_tag/:name" => "posts#shop_tag"
    # チャット機能
    get "chat/:id" => "chats#show", as: "chat"
    resources :chats, only: [:create]

    # 投稿機能
    resources :posts do
      # 地図編集ページ
      get "map/edit" => "posts#map_edit"
      # コメント・お気に入り機能
      resources :comments, only: [:new, :create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    resources :free_posts, only: [:new, :create, :index, :show, :destroy]
  end
end
