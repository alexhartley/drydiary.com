When(/^I change my password$/) do
  click_on 'account'
  fill_in 'New password', with: 'catcat'
  fill_in 'New password confirmation', with: 'catcat'
  fill_in 'Password', with: 'test1234'
  click_on 'Update'
end

Then(/^my old password no longer works$/) do
  click_on 'sign out'
  click_on 'sign in'
  fill_in 'Email', with: 'catface@drydiary.com'
  fill_in 'Password', with: 'test1234'
  click_on 'Sign in'
  step "I am informed of my error"
end

Then(/^my new one does$/) do
  fill_in 'Email', with: 'catface@drydiary.com'
  fill_in 'Password', with: 'catcat'
  click_on 'Sign in'
  page.should have_content 'catface'
  page.should have_content 'sign out'
end

When(/^I try to change my account settings$/) do
  click_on 'account'
  fill_in 'Username', with: 'cattitude'
end

When(/^I forget to enter my current password$/) do
  click_on 'Update'
end

Then(/^I am told I must enter my password to save the settings$/) do
  page.should have_content "Not quite! You need to enter your password"
end

When(/^I change my username, pronoun and what I'm giving up$/) do
  click_on 'account'
  fill_in 'Username', with: 'cattitude'
  select 'hir', from: 'Preferred pronoun'
  fill_in %{"I'm giving up..."}, with: 'furballs'
  fill_in 'Password', with: 'test1234'
  click_on 'Update'
end

Then(/^the changes are reflected in my diary$/) do
  visit '/cattitude'
  page.should have_content 'cattitude is on hir 0th day without furballs'
end

When(/^I try to change my username to one that has already been taken$/) do
  click_on 'account'
  fill_in 'Username', with: 'dogface'
  fill_in 'Password', with: 'test1234'
  click_on 'Update'
end

Then(/^I am told the username has already been taken$/) do
  page.should have_content 'Not quite! Unfortunately that username has already been taken.'
end
