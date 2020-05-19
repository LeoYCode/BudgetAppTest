Given(/^I am on Budget Screen$/) do
  @budget_page = BudgetPage.new
  @budget_page.load
end

When(/^I click reports tab$/) do
  @budget_page.reports_tab.click
end

When(/^I change description to "([^"]*)"$/) do |updated_description|
  page.driver.browser.navigate.refresh
  @budget_page.table_rows[0].click
  @budget_page.table_edit_description.set(updated_description)
  @budget_page.update_button.click
end

Then(/^I should be on reports page$/) do
  expect(@budget_page).to have_current_path("/reports/inflow-outflow")
end

Then(/^I should see total calculations module displayed$/) do
  expect(@budget_page).to have_expenditure_table
end

Then(/^I should see month expenditure table displayed$/) do
  expect(@budget_page).to have_working_balance
end

Then(/^I should see description updated to "([^"]*)"$/) do |updated_description|
  #Test will fail due to incorrect assertion on updated description
  expect(@budget_page.table_description.text).to eq(updated_description)
end