Rails.application.routes.draw do
  root 'posts#index'

  get '/posts' => 'posts#index'

  get '/posts/new' => 'posts#new'

  post '/posts' => 'posts#create'

  get '/posts/:id' => 'posts#show', as: :post

  get '/posts/:id/edit' => 'posts#edit', as: :edit_post

  patch '/posts/:id' => 'posts#update'

  delete '/posts/:id' => 'posts#destroy'

end