Feature: Budget management application

  As a user
  I want a budget management tool
  So I can track expenditure

  Background:
    Given I am on Budget Screen

  @mobile
  Scenario: Total calculations displayed
    Then I should see total calculations module displayed

  Scenario: Report tab
    When I click reports tab
    Then I should be on reports page

  Scenario: Change Description name
    When I change description to "Local supermarket milk"
    Then I should see description updated to "Local supermarket milks"
