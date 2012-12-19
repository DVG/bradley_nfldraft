Feature: Draftable players
  In order to see which players are still draftable
  As a User
  I want to be able to view all remaining players alphabetically by position
  
  Scenario: Undrafted Player shown under their position
    Given an undrafted player with a position of "QB"
    When I visit the undrafted players page
    Then I should see the player listed under the position "QB"

  Scenario: Undrafted Players are showin in alphabetical order under their position
    Given two undrafted players with a position of "QB"
    When I visit the undrafted players page
    Then I should see the players in alphabetical order under the position "QB"