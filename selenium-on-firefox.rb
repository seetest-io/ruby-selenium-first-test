require 'test/unit'
require 'selenium-webdriver'
# require 'selenium/webdriver/remote'

class Example < Test::Unit::TestCase
  def setup
    desired_caps = {
        :testName=> 'Running Selenium on Firefox',
        :platform=> 'ANY',
        :browserName	=> 'firefox',
        javascript_enabled: true,
        css_selectors_enabled: true,
        # In order to use the grid code generation, you need to be connected to the cloud
        :accessKey=> 'eyJ4cC51Ijo0LCJ4cC5wIjoyLCJ4cC5tIjoiTVRVd09UVXlNVFkwT1RFeE1nIiwiYWxnIjoiSFMyNTYifQ.eyJleHAiOjE4MzA2ODc0MTksImlzcyI6ImNvbS5leHBlcml0ZXN0In0.OH5l0zjt5pIGFIRsuwpXWuDrMXsQAND2AJEEw-hc3y8'
    }

    @driver = Selenium::WebDriver.for(:remote, :url => 'http://mastercloud/wd/hub', :desired_capabilities => desired_caps)
  end

  def test_selenium_on_firefox
    @driver.navigate.to "https://seetest.io"
	
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until{@driver.find_element(:xpath => "//*[text()='Manual']")}
    manual_nav_link = @driver.find_element(:xpath, "//*[text()='Manual']")
    manual_nav_link.click
	
    automation_nav_link = @driver.find_element(:xpath, "//*[text()='Automation']")
    automation_nav_link.click
	
	webinar_footer_link = @driver.find_element(:xpath, "//*[text()='Webinars']")
	
	webinar_footer_link.click
	
	webinars_h2_title_text = @driver.find_element(:xpath, "//h2[1]").text
	
	puts("The title of the first h2 is: " + webinars_h2_title_text)
	
    
  end

 def teardown
     @driver.quit
 end
end