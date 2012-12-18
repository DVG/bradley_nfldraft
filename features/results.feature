Feature: Results
  In order to get a real time update
  As a User
  I want to see the results of the draft by round and by NFL Team

  Scenario: Drafted Players are listed by round
    Given two teams who drafted players in round 1
    When I view the results by round
    Then I should see the players listed under round 1
  
  Scenario: Players are displayed in their respective rounds
    Given two players drafted in two different rounds
    When I view the results by round
    Then I should see the players under the correct rounds
    
  @focus
  Scenario: Drafted Players are listed by team
    Given two teams who drafted players
    When I view the results by team
    Then I should see the players listed under their team
    