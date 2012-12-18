class AddConsumedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :consumed, :boolean, :default => false
  end
end
