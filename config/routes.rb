Rails.application.routes.draw do
  root to: "shows#index"

  resources :shows
end
