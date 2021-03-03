Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
   get  'relationships_follower' => 'relationships#follower'
   get  'relationships_followed' => 'relationships#followed'
 end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :books do
    resources :comments,only: [:create, :destroy]
    resource :favorite,only: [:create, :destroy]
  end
end