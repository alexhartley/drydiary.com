When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I am welcomed$/) do
  page.should have_content 'welcome to dry diary'
end

When(/^I visit a user's diary$/) do
  visit '/catface'
end

Then(/^I see their posts$/) do
  page.should have_content 'catface is on their 0th day without catnip'
  page.should have_selector '.days .day'
end

Then(/^I cannot edit (?:them|it)$/) do
  page.should_not have_content 'edit'
  page.should_not have_selector 'input[name="tick"]'
end

When(/^I visit a user's post$/) do
  step "I visit a user's diary"
  click_on 'view'
end

Then(/^I can see the post$/) do
  page.should have_selector '#show-day'
end
