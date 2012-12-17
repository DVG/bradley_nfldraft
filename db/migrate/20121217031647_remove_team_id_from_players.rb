class RemoveTeamIdFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :team_id, :integer
  end
end
