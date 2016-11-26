Rails.application.routes.draw do

  root 'blogs#index'

  get 'blogs/new' => 'blogs#new'
  post 'blogs' => 'blogs#create'
  get 'blogs' => 'blogs#index'
  post 'blogs/:id' => 'blogs#like_index',as:'like_index'
  get 'blogs/show/:id' => 'blogs#show', as:'blog'
  post 'blogs/show/:id' => 'blogs#like_show',as:'like_show'

  get 'replies/new' => 'replies#new'
  post 'blogs/show/:id/replies' => 'replies#create', as:'replies'

end
