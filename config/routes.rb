Rails.application.routes.draw do
  resources :pets
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	match 'dashboard', to: redirect('/'), via: :get
	match 'dashboard/new', to: redirect('/'), via: :get
	match 'dashboard/index', to: redirect('/'), via: :get
	root to: 'dashboard#new'

	match 'signup', to: 'users#new', via: :get
	match 'login', to: 'dashboard#new', via: :get
	match 'logout', to: 'dashboard#destroy', via: :get
	
	resource :dashboard, controller: 'dashboard', except: [:new, :destroy]

	resources :users, except: [:edit, :update] do
		resources :pets
	end

	match 'user_settings', to: 'users#edit', as: :user_settings, via: :get
	match 'user_settings', to: 'users#update', as: :update_user, via: :put
end
