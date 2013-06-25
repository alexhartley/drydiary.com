DrydiaryCom::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" } do
    resources :days, only: [:create, :update]
  end

  get ':username' => 'dry#show'
  get ':username/:year/:month/:day' => 'days#show'
  get ':username/:year/:month/:day/edit' => 'days#edit'

  root 'dry#index'
end
