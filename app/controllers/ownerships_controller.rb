class OwnershipsController < ApplicationController
  def new
    @ownership = Ownership.new
    @order = Order.next
    @team = @order.team
    @ownership.team = @team
    @players = Player.undrafted_players
  end

  def create
    @team = Team.find(params[:ownership][:team_id])
    @player = Player.find(params[:ownership][:player_id])
    @order = Order.find(params[:ownership][:order_id])
    if @team.acquire(@player)
      @order.consumed = true
      @order.save
      redirect_to new_ownership_path, notice: "Successfully drafted #{@player.name} into #{@team.name}"
    else
      render "new", alert: "Failed to draft player"
    end
  end
end
