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
  it "returns orders by round then by pick" do
    order_one = create(:order, round: 1, pick: 2)
    order_two = create(:order, round: 1, pick: 1)
    Order.all.should == [order_two, order_one]
  end
  it "returns weather an order has been consumed" do
    order = create(:consumed_order)
    order.consumed?.should be_true
  end
  it "marks itself as consumed" do
    order = create(:order)
    order.consume
    order.reload
    order.consumed?.should be_true
  end
  it "returns the first unconsumed order" do
    consumed_order = create(:consumed_order, round: 1, pick: 1)
    unconsumed_order = create(:order, round: 1, pick: 2)
    Order.next.should eq unconsumed_order
  end
  it "returns true if there is another order" do
    create(:consumed_order)
    create(:order)
    Order.next?.should be_true
  end
  it "returns false if there is not another order" do
    create(:consumed_order)
    Order.next?.should be_false
  end
end
