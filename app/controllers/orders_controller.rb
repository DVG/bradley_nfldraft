class OrdersController < ApplicationController
  def latest
    @players = Player.latest_picks
    @order = Order.next
  end
end
