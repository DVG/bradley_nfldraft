Given /^two teams who drafted players in round (\d+)$/ do |num|
  @order_one = create(:order, round: 1, pick: 1, team: @team_one)
  @order_two = create(:order, round: 1, pick: 2, team: @team_two)
  @ownership_one = create(:ownership, order: @order_one, player: create(:player, name: "Player One"))
  @ownership_two = create(:ownership, order: @order_one, player: create(:player, name: "Player Two"))
  @player_one = @ownership_one.player
  @player_two = @ownership_two.player
end

Given /^two players drafted in two different rounds$/ do
  @order_one = create(:order, round: 1, pick: 1, team: @team_one)
  @order_two = create(:order, round: 2, pick: 1, team: @team_two)
  @ownership_one = create(:ownership, order: @order_one, player: create(:player, name: "Player One"))
  @ownership_two = create(:ownership, order: @order_two, player: create(:player, name: "Player Two"))
  @player_one = @ownership_one.player
  @player_two = @ownership_two.player
  
end

Given /^two teams who drafted players$/ do
  @ownership_one = create(:ownership, player: create(:player, name: "Player One"))
  @ownership_two = create(:ownership, player: create(:player, name: "Player Two"))
  @team_one = @ownership_one.team
  @team_two = @ownership_two.team
  @player_one = @ownership_one.player
  @player_two = @ownership_two.player
end

When /^I view the results by team$/ do
  visit results_by_team_ownerships_path
end


When /^I view the results by round$/ do
  visit results_by_round_ownerships_path
end

Then /^I should see the players listed under round (\d+)$/ do |num|
  within "#round_#{num}" do
    page.should have_content @player_one.name
    page.should have_content @player_two.name
  end
end

Then /^I should see the players under the correct rounds$/ do
  within "#round_#{@order_one.round}" do
    page.should have_content @player_one.name
    page.should_not have_content @player_two.name
  end
  within "#round_#{@order_two.round}" do
    page.should_not have_content @player_one.name
    page.should have_content @player_two.name
  end
end

Then /^I should see the players listed under their team$/ do
  within "#team_#{@team_one.id}" do
    page.should have_content @player_one.name
    page.should_not have_content @player_two.name
  end
  within "#team_#{@team_two.id}" do
    page.should_not have_content @player_one.name
    page.should have_content @player_two.name
  end
end