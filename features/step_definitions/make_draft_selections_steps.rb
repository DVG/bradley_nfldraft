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
    "//select[@id='ownership_player_id']/option[@value='#{@undrafted_player.id}']"
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
    "//select[@id='ownership_player_id']/option[@text='#{@drafted_player.id}']"
end

Given /^an order, a player and a team$/ do
  @team = create(:team)
  @order = create(:order, team: @team)
  @player = create(:player)
  
  puts @order.inspect
end

When /^I draft the player$/ do
  visit new_ownership_path
  select @player_one.name, from: 'ownership_player_id'
  click_button 'Confirm Draft Selection'
end

Then /^the player should be associated with the team$/ do
  @player_one.reload
  @player_one.team.should eq @team_one
end

Given /^two orders two teams and two players$/ do
  @team_one = create(:team)
  @team_two = create(:team)
  @order_one = create(:order, team: @team_one)
  @order_two = create(:order, team: @team_two)
  @player_one = create(:undrafted_player)
  @player_two = create(:undrafted_player)
end

When /^I draft a player$/ do
  visit new_ownership_path
  select @player_one.name, from: 'ownership_player_id'
  click_button 'Confirm Draft Selection'
end

Then /^the second order's team should be displayed on the new ownership page$/ do
  page.should have_content @team_two.name
end