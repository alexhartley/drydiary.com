DrydiaryCom::Application.routes.draw do

  devise_for :users

  resource :dry

  resources :days, only: [:new, :create, :edit, :update]

  root 'dry#index'

  get ':id' => 'dry#show'

end
