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
      ownership = @player.ownership
      ownership.drafted_in(@order) # remember when you were drafted
      @order.consume # mark this order as done
      notice = "Successfully drafted #{@player.name} into #{@team.name}"
      if Order.next?
        redirect_to new_ownership_path, notice: notice
      else
        redirect_to page_path("draft_complete"), notice: notice
      end
    else
      render "new", alert: "Failed to draft player"
    end
  end
  
  def results_by_round
    @ownerships_by_round = Ownership.results_by_round
  end
end
