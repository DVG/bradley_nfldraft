Given /^a team called "(.+)" associated with an order$/ do |team|
  @team = create(:team, name: team)
  @order = create(:order, team: @team)
end

Given /^a player$/ do
  @player = create(:player)
end

When /^I visit the draft selection page$/ do
  visit new_ownership_path
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end

Given /^an order with round number (\d+) and pick number (\d+)$/ do |round, pick|
  @order = create(:order, round: round, pick: pick)
end

Given /^a team and player$/ do
  @team = create(:team)
  @player = create(:player)
end

Given /^an order, team and player$/ do
  @team = create(:team)
  @order = create(:order, team: @team)
  @player = create(:player)
end

Then /^the undrafted player should be in the draft selection picklist$/ do
  page.should have_xpath \
    "//select[@id='ownership_player_id']/option[@value='#{@undrafted_player.name}']"
end

Given /^a drafted player and an undrafted player$/ do
  @drafted_player = create(:drafted_player)
  @undrafted_player = create(:undrafted_player)
end

Given /^an order and team$/ do
  @order = create(:order)
  @team  = create(:team)
end

Then /^the undrafted player should not be in the draft selection picklist$/ do
  page.should_not have_xpath \
    "//select[@id='ownership_player_id']/option[@value='#{@drafted_player.name}']"
end