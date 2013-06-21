When /^I am on the homepage$/ do
  visit '/'
end

When /^I go to the sign in page$/ do
  click_on 'sign in'
end

When /^I fill in my email and password$/ do
  fill_in 'Email', with: 'catface@drydiary.com'
  fill_in 'Password', with: 'test1234'
  click_button 'Sign in'
end

Then /^I am signed in$/ do
  page.should have_content 'catface'
end

Then /^I am no longer signed in$/ do
  page.should_not have_content 'catface'
end

Given /^I have signed in$/ do
  steps %{
    * I go to the sign in page
    * I fill in my email and password
    * I am signed in
  }
end

When /^I choose to sign out$/ do
  click_on 'sign out'
end

Then /^I am taken back to the homepage$/ do
  page.should have_content 'sign in'
end
