BradleyNfldraft::Application.routes.draw do
  resources :ownerships, :only => [:new, :create]
end
