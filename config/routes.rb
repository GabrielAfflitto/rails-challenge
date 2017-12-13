Rails.application.routes.draw do
  resources :students do
  end

  resources :addresses
end
