require 'spec_helper'

describe Order do
  it "returns a round" do
    build(:order).should respond_to(:round)
  end
  it "returns a pick" do
    build(:order).should respond_to(:pick)
  end
  it "is associated with a team" do
    team = create(:team)
    build(:order, team: team).team.should eq team
  end 
end
