require 'spec_helper'

describe Player do
  it "is invalid without a name" do
    build(:player, name: nil).should_not be_valid
  end
  it "is invalid without a position" do
    build(:player, position: nil).should_not be_valid
  end
  it "players with teams can not be drafted" do
    create(:drafted_player).should_not be_draftable
  end
  it "players without teams can be drafted" do
    build(:undrafted_player).should be_draftable
  end
  it "player should no longer be draftable after being acquired" do
    player = create(:undrafted_player)
    team = create(:team)
    team.acquire(player)
    player.should_not be_draftable
  end
  it "returns a collection of undrafted players" do
    drafted_player = create(:drafted_player)
    undrafted_player = create(:undrafted_player)
    Player.undrafted_players.should_not include drafted_player
  end
end
