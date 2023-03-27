Feature: User can manually add post (1 Feature)



Scenario: Add a post
    Given I am on the SocialNews home page
    When I follow "Clicca qui per fare il login" 
    Then I should be on the Sign_in page
    When I follow "Sign up"
    Then I should be on the Sign Up page
    When I fill in "name" with "prova"
    And I fill in "username" with "prova"
    And I fill in "email" with "prova@prova"
    And I fill in "password" with "123456"
    And I fill in "password_confirmation" with "123456"
    And I press "Sign up"
    Then I should be on the SocialNews home page
    When I follow "New post"
    When I fill in "Title" with "Nuovo post"
    And I select "Affari" from "Category"
    And I fill in "Body" with "Questo è un testo"
    And I press "Create Post"
    Then I should be on the SocialNews home page
    And I should see "Nuovo post"
