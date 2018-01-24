Rails.application.routes.draw do

  get 'welcome/about'

  devise_for :users

  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment

  resources :forum_threads
  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end

  root to: 'welcome#index'
end
