Feature: Latest activity
  In order to see only what is actively happening
  As a User
  I want to see the latest 3 picks and which team is next to pick
  
  Scenario: Displays latest 3 picks on Latest Activity page
    Given 3 drafted players
    When I visit the latest activity page
    Then I should see the three players listed
    
  @focus
  Scenario: Displays the next team able to draft  
    Given a drafted player and an unconsumed round
    When I visit the latest activity page
    Then I should see the next order listed

  
