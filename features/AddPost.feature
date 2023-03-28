Feature: Create a post as a not registered user
  As a not registered user
  I want to create a new post
  So that I can share information with other users


Scenario: Add a post
    Given I am on the SocialNews home page
    When I follow registration steps
    Then I should be on the SocialNews home page
    And I press the pencil button
    When I fill in "Title" with "Nuovo post"
    And I select "Affari" from "Category"
    And I fill in "Body" with "Questo è un testo"
    And I press "Create Post"
    Then I should be on the SocialNews home page
    #And I should see "Nuovo post"
