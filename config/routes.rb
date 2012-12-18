BradleyNfldraft::Application.routes.draw do
  resources :ownerships, :only => [:new, :create] do
    get 'results_by_round', :on => :collection, :as => :results_by_round
    get 'results_by_team', :on => :collection, :as => :results_by_team
  end
end
