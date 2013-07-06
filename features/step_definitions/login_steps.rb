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
  page.should have_content 'sign out'
end

Then /^I am no longer signed in$/ do
  page.should_not have_content 'catface'
end

Given /^I have signed in$/ do
  step "I am on the homepage"
  step "I go to the sign in page"
  step "I fill in my email and password"
  step "I am signed in"
end

When /^I choose to sign out$/ do
  click_on 'sign out'
end

Then /^I am taken back to the homepage$/ do
  page.should have_content 'sign in'
end

When(/^I get my password wrong$/) do
  click_on 'sign in'
  fill_in 'Email', with: 'catface@drydiary.com'
  fill_in 'Password', with: 'WRONGWRONG'
  click_on 'Sign in'
end

Then(/^I cannot sign in$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am informed of my error$/) do
  page.should have_content "Sign in"
  page.should have_content "Your email or password is incorrect."
end
