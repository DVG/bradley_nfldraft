BradleyNfldraft::Application.routes.draw do
  get "orders/latest"

  get "players/undrafted_players"

  resources :ownerships, :only => [:new, :create] do
    get 'results_by_round', :on => :collection, :as => :results_by_round
    get 'results_by_team', :on => :collection, :as => :results_by_team
  end
  match "undrafted_players" => 'players#undrafted_players', :as => :undrafted_players
  match "latest" => 'orders#latest', :as => :latest_orders
end
