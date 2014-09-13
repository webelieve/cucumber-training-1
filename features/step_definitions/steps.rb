Given /^I go to the login page$/ do
  @browser.goto($base_url + '/login')
end

When /^I enter "([^"]*)" into the username$/ do |username|
  @browser.text_field(:id => 'login').set username
end

When /^I enter "([^"]*)" into the password$/ do |password|
  @browser.text_field(:id => 'password').set password
end

When /^I press the login button$/ do
  @browser.button(:name => 'commit').click
end

Then /^I am logged in$/ do
  Watir::Wait.until(5) {
    @browser.text.include? 'Welcome'
  }
end

When /^I am on the account page$/ do
  #TODO use rspec expectations instead of should from now on
  @browser.url.should == $base_url + '/account'
  Watir::Wait.until(5) {
    @browser.text.include? 'Name:'
  }
end

When /^I click the logout link$/ do
  @browser.link(:text => /Logout/).click
end

Then /^I am on the login page$/ do
  login_button = @browser.button(:name => 'commit')
  Watir::Wait.until(5) {
    login_button.exists?
  }
end