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
    player.reload
    player.should_not be_draftable
  end
  it "returns a collection of undrafted players" do
    drafted_player = create(:drafted_player)
    undrafted_player = create(:undrafted_player)
    Player.undrafted_players.should_not include drafted_player
  end
  it "returns undrafted players grouped by position" do
    qb_one = create(:undrafted_player, position: "QB")
    qb_two = create(:undrafted_player, position: "QB")
    hb     = create(:undrafted_player, position: "HB")
    expected_hash = {
      "QB" => [qb_one, qb_two],
      "HB" => [hb]
    }
    Player.undrafted_by_position.should eq expected_hash
  end
  it "returns the players in alpha order by position" do
    qb_two = create(:undrafted_player, position: "QB", name: "Bob Dole")
    qb_one = create(:undrafted_player, position: "QB", name: "Amanda Holdenkiss")
    expected_hash = {
      "QB" => [qb_one, qb_two]
    }
    Player.undrafted_by_position.should eq expected_hash
  end
  it "doesnt return drafted players" do
    qb_two = create(:undrafted_player, position: "QB", name: "Bob Dole")
    qb_one = create(:drafted_player, position: "QB", name: "Amanda Holdenkiss")
    expected_hash = {
      "QB" => [qb_two]
    }
    Player.undrafted_by_position.should eq expected_hash
  end
  it "the hash keys are in alphabetical order" do
    two = create(:undrafted_player, position: "QB", name: "Bob Dole")
    one = create(:undrafted_player, position: "HB", name: "Amanda Holdenkiss")
    three = create(:undrafted_player, position: "X", name: "Adam George")
    Player.undrafted_by_position.keys.should eq ["HB", "QB", "X"]
  end
  context "latest picks" do
    it "returns the three latest drafted players" do
      one = create(:drafted_player)
      two = create(:drafted_player)
      three = create(:drafted_player)
      four = create(:drafted_player)
      Player.latest_picks.should eq [four, three, two]
    end
    it "does not return undrafted players" do
      one = create(:drafted_player)
      two = create(:drafted_player)
      three = create(:drafted_player)
      four = create(:undrafted_player)
      Player.latest_picks.should eq [three, two, one]
    end
  end
end
