Rails.application.routes.draw do

  get 'comments/create', to: 'form#comments_create'

  get 'comments/destroy'

  get 'welcome/about'

  devise_for :users

  resources :forum_threads
  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end

  root to: 'welcome#index'
end
