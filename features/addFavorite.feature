Feature: Save a post into favorite
  As a registered user
  I want to save my favorite posts
  So that i can save them


Scenario: Add a favorite
    Given I am on the SocialNews home page
    When I follow registration steps
    Then I should be on the SocialNews home page
    And I press the favorite button for the first post
    And I press user button
    Then I should be on the User page
    When I follow "Preferiti"
    Then I should be on the Favorite page
    And I should see the favorite post
    