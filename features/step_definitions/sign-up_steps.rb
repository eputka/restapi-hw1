require 'rest-client'
require 'time'

Given(/^I have signed up as a regular user$/) do
  @user = User.new("edgars.putka-#{Time.now.to_i}@testdevlab.com", "parole123")
  sign_up_positive(@user)
end