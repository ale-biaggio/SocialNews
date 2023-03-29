Feature: Save a post into favourite
  As a registered user
  I want to save my favourite posts
  So that i can save them


Scenario: Add a post
    Given I am on the SocialNews home page
    When I follow registration steps
    Then I should be on the SocialNews home page
    And I press the favorite button
    And I press user button
    Then I should be on the User page
    When I follow "Favorites"
    Then I should be on the Favourite page
   