@FeatureFile:ResearchInnovation
Feature: Content Presentation of Research and Innovation Stories

  # As a system user or public visitor,
  # I want to access and navigate research initiatives and innovation stories,
  # So that I can stay informed about the latest developments.

  Background:
    Given the content database contains at least 10 fully published Research Initiative stories
    And the current date is within the valid publication period for all published stories

  @SmokeTest @ContentDisplay
  Scenario: Successful Display of the Research Stories Landing Page

    Given I am navigating to the "Research Initiatives and Innovation" landing page
    When the page has fully loaded
    Then the page title should contain "Research Initiatives"
    And at least 5 distinct innovation stories are displayed on the first page
    And each displayed story entry includes:
      | Element       | Requirement       |
      | Title         | Must not be empty |
      | Publication Date | Must be present   |
      | Featured Image | Must be displayed |
      | Summary/Excerpt | Must be present   |

    When I click on the first displayed story title
    Then I am successfully navigated to the full detail page for that story
    And the full body content of the story is displayed

  @Usability @Filtering
  Scenario: Filtering Stories by Topic Category

    Given I am viewing the list of published innovation stories
    And the stories are categorized with tags including "Sustainability," "AI," and "HealthTech"
    When I select the filter option "Sustainability"
    Then the displayed list of stories should only contain stories tagged "Sustainability"
    And the total count of displayed stories matches the count of "Sustainability" tagged stories
    When I clear the active filter
    Then all available published stories are displayed again

  @SearchFunctionality
  Scenario: Searching for a Specific Initiative by Keyword

    Given a published story exists with the title "Quantum Leap in Battery Technology"
    And the story content includes the keyword "Lithium-Ion"
    When I enter the search term "Quantum Leap" into the search bar
    And I execute the search
    Then the search results page displays the story titled "Quantum Leap in Battery Technology"
    And the search result count is exactly 1

  @ContentManagement @EditorWorkflow
  Scenario: Successful Publication of a New Innovation Story

    Given I am logged in as a Content Editor with publishing permissions
    And I have created a new draft story titled "Future of Robotics: 2024 Outlook"
    And the story has valid mandatory content (Title, Author, Body)
    When I set the publication status to "Published"
    And I click the "Save and Publish" button
    Then a confirmation message "Story successfully published" is displayed
    And the system records the current user as the publisher
    
    When I navigate to the public "Research Initiatives and Innovation" landing page
    Then the story titled "Future of Robotics: 2024 Outlook" is visible in the list

  @ContentManagement @Unpublish
  Scenario: Removing a Published Story from Public View

    Given I am logged in as a Content Editor
    And a story titled "Legacy Project 2018" is currently published and public-facing
    When I edit the "Legacy Project 2018" story
    And I change the publication status to "Draft" or "Archived"
    And I click the "Save Changes" button
    Then a confirmation message is displayed
    
    When I navigate to the public "Research Initiatives and Innovation" landing page
    Then the story titled "Legacy Project 2018" is no longer visible in the list
    And searching for "Legacy Project 2018" returns no public results