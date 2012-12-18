Feature: Make draft selections
  In order to record the results of the Draft in real-time
  As a System Administrator (don't implement authorization)
  I want to assign a player to a team during the draft period
  (which is defined by the draft order)
  
  Scenario: Show team name on draft selection page
    Given a team called "Pittsburg Steelers" associated with an order
    And a player
    When I visit the draft selection page
    Then I should see "Pittsburg Steelers"
    
  Scenario: Show Round number on draft selection page
    Given an order with round number 1 and pick number 1
    And a team and player
    When I visit the draft selection page
    Then I should see "Round: 1"
    
  Scenario: Show Pick Number on the draft selection page
    Given an order with round number 1 and pick number 1
    And a team and player
    When I visit the draft selection page
    Then I should see "Pick: 1"

  Scenario: Player should be shown in the draft picklist
    Given a drafted player and an undrafted player
    And an order and team
    When I visit the draft selection page
    Then the undrafted player should be in the draft selection picklist
    
  Scenario: Drafted player is not shown in the draft picklist
    Given a drafted player and an undrafted player
    And an order and team
    When I visit the draft selection page
    Then the undrafted player should not be in the draft selection picklist
    
  Scenario: Drafting a player associates them with a team
    Given two orders two teams and two players
    When I draft the player
    Then the player should be associated with the team
    
  Scenario: Drafting a player advances user to next order
    Given two orders two teams and two players
    When I draft a player
    Then the second order's team should be displayed on the new ownership page
    
  Scenario: Complete the draft
    Given an order, team and player
    When I draft a player
    Then I should see the message "There are no more drafts, the NFL Draft is complete!"
    
  Scenario: Order is associated with the new ownership after the draft
    Given an order, team and player
    When I draft a player
    Then the order should be associated with the ownership