When(/^I fill in the registration form/) do
  fill_in 'Email', with: 'russell@drydiary.com'
  fill_in 'Password', with: 'reallygoodpassword'
  fill_in 'Password confirmation', with: 'reallygoodpassword'
  fill_in 'Desired username', with: 'fantastic mr fox'
  select 'hir', from: 'Preferred pronoun'
  fill_in %{"I'm giving up..."}, with: 'chickens'
  first('input[type="submit"]').click
end

Then(/^an account is created for me and I am logged in$/) do
  page.should have_text 'fantastic mr fox is on hir 0th day without chickens'
  User.where(email: 'russell@drydiary.com').one.should be_present
end

When(/^I try to sign up with a username that is already taken$/) do
  steps %{
    * I fill in the registration form
    * I choose to sign out
    * I fill in the registration form
  }
end
