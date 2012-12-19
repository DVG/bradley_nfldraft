Given /^an undrafted player with a position of "(.+)"$/ do |position|
  @player = create(:undrafted_player, position: position)
end

Given /^two undrafted players with a position of "(.+)"$/ do |position|
  @player_one = create(:undrafted_player, name: "Brad Wilson", position: position)
  @player_two = create(:undrafted_player, name: "Adam West", position: position)
end

When /^I visit the undrafted players page$/ do
  visit undrafted_players_path
end

Then /^I should see the player listed under the position "(.+)"$/ do |position|
  within "##{position}" do
    page.should have_content @player.name
  end
end

Then /^I should see the players in alphabetical order under the position "(.+)"$/ do |position|
  page.text.should match /(#{@player_two.name}).+(#{@player_one.name})/m
end