Given /^3 drafted players$/ do
  @o_one = create(:ownership, player: create(:player, name: "Alex"))
  @o_two = create(:ownership, player: create(:player, name: "Bob"))
  @o_three = create(:ownership, player: create(:player, name: "Chris"))
end

Given /^a drafted player and an unconsumed round$/ do
  @ownership = create(:ownership, order: create(:order, round: 1, pick: 1, consumed: true))
  @order = create(:order, round: 1, pick: 2, team: create(:team))
end

When /^I visit the latest activity page$/ do
  visit latest_orders_path
end

Then /^I should see the three players listed$/ do
  page.text.should match /(#{@o_three.player.name}).+(#{@o_two.player.name}).+(#{@o_one.player.name})/m
end

Then /^I should see the next order listed$/ do
  within "#next_order" do
    page.should have_content @order.team.name
  end
end
