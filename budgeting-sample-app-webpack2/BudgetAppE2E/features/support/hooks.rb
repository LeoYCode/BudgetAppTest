After do |scenario|
  screen_shots='features/reports/screenshots'
  encoded_img = page.driver.browser.screenshot_as(:base64)

  if scenario.failed? && !scenario.source_tag_names.include?("@mobile")
    page.driver.browser.manage.window.maximize
    page.driver.browser.save_screenshot("#{screen_shots}/#{scenario.name}-#{Time.now.strftime('%a, %d %b %Y %H:%M:%S')}.png")
    embed("data:image/png;base64,#{encoded_img}",'image/png', scenario.name)
  elsif scenario.failed?
    page.driver.browser.save_screenshot("#{screen_shots}/#{scenario.name}-#{Time.now.strftime('%a, %d %b %Y %H:%M:%S')}.png")
    embed("data:image/png;base64,#{encoded_img}",'image/png', scenario.name)
  end
end
