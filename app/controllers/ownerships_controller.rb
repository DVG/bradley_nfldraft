class OwnershipsController < ApplicationController
  def new
    @ownership = Ownership.new
    @order = Order.first
    @team = @order.team
    @ownership.team = @team
    @players = Player.undrafted_players
  end

  def create
  end
end
