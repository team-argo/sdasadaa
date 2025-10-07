@WebUI @HomePage @HealthcareServices
Feature: Healthcare Services Home Page Development

  As a potential patient or existing user,
  I need a clear, informative, and easy-to-navigate home page,
  So that I can quickly find information about services and access patient tools.

  Background:
    Given the user has an active internet connection
    And the system under test is operational

  # =========================================================================
  # Scenario 1: Visual Integrity and Branding
  # Checks that the page loads correctly and displays required branding elements.
  # =========================================================================
  @BasicAccess @Branding
  Scenario: Successful Page Load and Branding Verification
    When the user navigates to the application's root URL
    Then the HTTP response code should be 200 (OK)
    And the browser page title should contain "Healthcare Services" or "Home"
    And the company logo must be prominently displayed in the header
    And the primary color scheme must adhere to the defined corporate brand guidelines

  # =========================================================================
  # Scenario 2: Primary Navigation Structure
  # Ensures all essential navigation links are present and accessible.
  # =========================================================================
  @Navigation
  Scenario: Verification of Core Navigation Links
    Given the user is viewing the Healthcare Services Home Page
    Then the main navigation bar should be visible and accessible
    And the navigation bar should contain the following links:
      | Link Text      | Expected Destination Path |
      | Services       | /services                 |
      | Providers      | /providers                |
      | Locations      | /locations                |
      | About Us       | /about                    |
      | Contact        | /contact                  |
    And the "Patient Portal Login" link/button should be clearly distinguishable from other navigation links

  # =========================================================================
  # Scenario 3: Search Functionality
  # Verifies that users can search for information directly from the home page.
  # =========================================================================
  @Search
  Scenario: Functional Global Search Bar
    Given the user is on the Healthcare Services Home Page
    When the user views the header section
    Then a visible and interactive search input field should be present
    When the user enters the search term "Urgent Care" into the search field
    And the user clicks the Search button
    Then the user should be redirected to the Search Results page
    And the search results should display relevant links containing "Urgent Care"

  # =========================================================================
  # Scenario 4: Core Content and Call-to-Action (CTA)
  # Confirms the presence of the main promotional content and CTA buttons.
  # =========================================================================
  @Content @CTA
  Scenario: Prominent Hero Section and Appointment CTA
    Given the user is on the Healthcare Services Home Page
    Then the primary "Hero" content area should be visible
    And a highly visible Call-to-Action button titled "Schedule an Appointment" should be present
    When the user clicks the "Schedule an Appointment" button
    Then the user should be navigated to the Appointment Booking page
    And the page should display summary cards for at least three key service areas (e.g., Primary Care, Specialties, Emergency)

  # =========================================================================
  # Scenario 5: Responsive Design Verification
  # Uses a Scenario Outline to test responsiveness across different common device sizes.
  # =========================================================================
  @Responsive @Mobile
  Scenario Outline: Page Layout Adjusts Correctly on Different Viewports
    Given the user accesses the Home Page on a "<Device>" viewport size
    Then the page layout should adjust without requiring horizontal scrolling
    And the primary navigation should transform into a collapsed (hamburger) menu
    And the images should scale appropriately to fit the container
    And the main Call-to-Action button should remain visible within the top fold

    Examples:
      | Device        | Viewport Width (px) |
      | Desktop Large | 1440                |
      | Tablet        | 768                 |
      | Mobile Phone  | 375                 |

  # =========================================================================
  # Scenario 6: Footer Content Verification
  # Ensures necessary legal and contact information is present.
  # =========================================================================
  @Footer @Legal
  Scenario: Verification of Footer Content and Links
    Given the user scrolls to the bottom of the Healthcare Services Home Page
    Then the footer section should be visible
    And the footer should contain the current year's copyright notice
    And the footer should contain links to the following mandatory legal documents:
      | Document Link       |
      | Privacy Policy      |
      | Terms of Service    |
      | Accessibility Policy|
    And the primary contact phone number should be displayed in a click-to-call format