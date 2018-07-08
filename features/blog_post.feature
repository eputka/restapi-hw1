Feature: Blog post feature
  This feature is used to test blog post creation and maintenance

  Scenario: Create blog post - positive
    Given I have logged in as a regular user
    And I can access my profile
    When I create a blog post
    Then I check if blog post is created

  Scenario: Update created blog post - positive
    Given I have logged in as a regular user
    And I can access my profile
    When I create a blog post
    Then I check if blog post is created
    When I update blog post title
    Then I check if blog post was updated