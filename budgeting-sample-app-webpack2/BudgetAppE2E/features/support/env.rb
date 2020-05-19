require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'webdrivers'
require 'logger'

log = Logger.new(STDOUT)

browser_name = ENV['BROWSER'] || 'chrome'
Webdrivers.install_dir = File.expand_path(Dir.pwd)

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = 'https://budget.modus.app'
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver(:iphone_headless) do |app|
  user_agent = 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: (%w[ headless disable-gpu hide-scrollbars ] << "--user-agent='#{user_agent}'") }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

case browser_name.upcase
  when 'CHROME'
    Capybara.default_driver = :selenium_chrome
    log.info("Loading Chrome Driver")
  when 'FF', 'FIREFOX'
    Capybara.default_driver = :selenium
    log.info("Loading FireFox Driver")
  when 'HEADLESS'
    Capybara.default_driver = :selenium_chrome_headless
    log.info("Loading Headless")
  when 'IPHONE'
    Capybara.default_driver = :iphone_headless
    Capybara.page.driver.browser.manage.window.resize_to(375, 667)
    log.info("Loading Iphone")
  else
    raise("Browser '#{browser_name}' is not supported. Use Firefox, Chrome, Iphone or Headless")
end
