class AddOrderIdToOwnership < ActiveRecord::Migration
  def change
    add_column :ownerships, :order_id, :integer
  end
end
