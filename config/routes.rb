Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  get '/posts' => 'posts#index'

  get '/posts/new' => 'posts#new'

  post '/posts' => 'posts#create'

  get '/posts/:id' => 'posts#show', as: :post

  get '/posts/:id/edit' => 'posts#edit', as: :edit_post

  patch '/posts/:id' => 'posts#update'

  delete '/posts/:id' => 'posts#destroy'

  post '/posts/:id' => 'posts#update_like', as: :update_like

  post '/comments/:id/comment' => 'comments#create_comment', as: :comments

  delete '/comments/:id' => 'comments#delete_comment', as: :delete_comments


end