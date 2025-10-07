Scenario: Verify access and display of Culture and Journey sections
  Given I am on the company's public website
  When I navigate to the "About Us" page
  Then the page title should be "About [Company Name]" or similar
  And I should see a clearly identifiable main section titled "Our Company Culture"
  And I should see a clearly identifiable main section titled "Our Journey" or "Company History"
```

### Scenario 2: Display and Validation of Company Culture Content

This scenario focuses on ensuring the core values and mission statement are clearly presented.

```gherkin
Scenario Outline: Verify display of mandatory Company Culture elements
  Given I am viewing the "Our Company Culture" section
  Then the primary Mission Statement should be visible
  And a description of the company's Core Values should be present
  And I should see the specific core value: "<Core_Value>" clearly defined
  And the content should be formatted for readability (e.g., bullet points, short paragraphs)

  Examples:
    | Core_Value       |
    | Innovation       |
    | Integrity        |
    | Customer Focus   |
    | Employee Growth  |
```

### Scenario 3: Display of the Company Journey/History Timeline

This scenario validates the historical narrative, often displayed as a timeline or chronological events list.

```gherkin
Scenario: Verify chronological display and content of the Company Journey
  Given I am viewing the "Our Journey" section
  Then the content should be displayed chronologically, starting with the founding date
  And I should see at least [3] distinct key milestone events clearly marked
  And each milestone event should include the year and a brief description of the achievement
  And the content should flow logically to the present day
  And clicking on a specific milestone (if interactive) should display relevant details without error
```

### Scenario 4: Visual and Media Integrity

Culture and history pages heavily rely on visual appeal. This scenario verifies the presence and functionality of media elements.

```gherkin
Scenario: Verify supporting visual elements and media integrity
  Given I am on the About Us page
  Then the "Company Culture" section should include relevant imagery (e.g., team photos, office shots)
  And all images used should load successfully without broken links
  And if an embedded video (e e.g., "Culture Video") is present, it should load and play correctly
  And the overall styling and typography of the content should adhere to brand guidelines
```

### Scenario 5: Mobile Responsiveness and Accessibility

This is a critical scenario to ensure the content is consumable across various devices.

```gherkin
Scenario: Content remains usable and legible on mobile devices
  Given I access the About Us page using a typical mobile viewport (e.g., screen width <= 414px)
  When I scroll through the "Company Culture" and "Our Journey" sections
  Then all text content should be fully legible and scale appropriately
  And the chronological timeline elements should stack or reflow clearly without horizontal scrolling
  And all images and embedded media should scale correctly and fit within the viewport
  And all interactive elements (if any) should remain touch-friendly and functional