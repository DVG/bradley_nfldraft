require 'spec_helper'

describe Ownership do
  it "returns the order associated with it" do
    order = create(:order)
    ownership = create(:ownership, order: order)
    ownership.order.should eq order
  end
  it "associates itself with an order when a draft occurs" do
    order = create(:order)
    ownership = create(:ownership, order: nil)
    ownership.drafted_in(order)
    ownership.reload
    ownership.order.should eq order
  end
end