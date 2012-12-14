require 'spec_helper'

describe Player do
  it "is invalid without a name" do
    build(:player, name: nil).should_not be_valid
  end
  it "is invalid without a position" do
    build(:player, position: nil).should_not be_valid
  end
  it "players with teams can not be drafted" do
    create(:player, team: create(:team)).should_not be_draftable
  end
  it "players without teams can be drafted" do
    build(:player, team: nil).should be_draftable
  end
  it "player should no longer be draftable after being acquired" do
    player = create(:player, team: nil)
    team = create(:team)
    team.acquire(player)
    player.should_not be_draftable
  end
end
