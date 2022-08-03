Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/edit'
    get 'posts/search'
  end
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
    get 'users/search'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # ユーザー用
  devise_for :user, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
end
