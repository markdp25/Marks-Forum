Rails.application.routes.draw do
  get 'forum_threads/index'

  get 'forum_threads/show'

  get 'forum_threads/new'

  get 'forum_threads/create'

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users

  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end

  root to: 'welcome#index'
end
