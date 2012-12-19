class PlayersController < ApplicationController
  def undrafted_players
    @players = Player.undrafted_by_position
  end
end
