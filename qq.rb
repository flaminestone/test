require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'

# Configure Capybara to use Selenium with Chrome
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :remote, url: 'http://selenium:4444/wd/hub', desired_capabilities: :chrome)
end

Capybara.default_driver = :selenium_chrome
Capybara.app_host = "https://www.google.com" # Replace with any URL you want to test

# Sample test to check if Chrome is working
class ChromeTest
  include Capybara::DSL

  def initialize
    visit('/')
    puts "Chrome is working! Browser title: #{title}"
  rescue => e
    puts "Chrome is not working. Error: #{e.message}"
  ensure
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

ChromeTest.new
