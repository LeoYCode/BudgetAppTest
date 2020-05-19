class BudgetPage < SitePrism::Page

  set_url('/budget')

  element :reports_tab, 'a[href*="/reports"]'
  elements :table_rows, '.opmhI tbody tr'
  element :table_description, '.opmhI tbody tr:nth-child(1) td:nth-child(2) ._3-t-g:nth-child(2)'
  element :table_edit_description, '.opmhI tbody tr td:nth-child(1) ._3R7ot:nth-child(2) input[type=text]'
  element :update_button, :xpath, "//button[text()='Update']"
  element :expenditure_table, '._3eF2Q'
end