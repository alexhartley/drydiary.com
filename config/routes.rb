DrydiaryCom::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resource :dry

  resources :days, only: [:new, :edit, :create, :update]

  root 'dry#index'

  get ':id' => 'dry#show'

end
