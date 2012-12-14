require 'spec_helper'

describe Team do
  it "is invalid without a name" do
    build(:team, name: nil).should_not be_valid
  end
  it "can draft a player" do
    team = create(:team)
    player = create(:player)
    team.acquire(player)
    team.reload
    team.players.should eq [player]
  end
end
