class OwnershipsController < ApplicationController
  def new
    if Order.next?
      @ownership = Ownership.new
      @order = Order.next
      @team = @order.team
      @ownership.team = @team
      @players = Player.undrafted_players
    else
      redirect_to page_path("draft_complete")
    end
  end

  def create
    @team = Team.find(params[:ownership][:team_id])
    @player = Player.find(params[:ownership][:player_id])
    @order = Order.find(params[:ownership][:order_id])
    if @team.acquire(@player)
      @order.consumed = true
      @order.save
      if Order.next?
        redirect_to new_ownership_path, notice: "Successfully drafted #{@player.name} into #{@team.name}"
      else
        redirect_to page_path("draft_complete")
      end
    else
      render "new", alert: "Failed to draft player"
    end
  end
end
