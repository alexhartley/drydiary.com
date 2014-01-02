Given(/^I registered more than 100 days ago$/) do
  @user = User.where(email: 'catface@drydiary.com').one
  @user.created_at = Date.today - 101
  @user.save!
end

Given(/^I have created more than 100 posts$/) do
  step "I registered more than 100 days ago"
  ((Date.today - 101)..Date.today).each do |date|
    day = @user.days.where(date: date).find_or_initialize_by
    day.text = "hello"
    day.save!
  end
end

Then(/^I see my most recent 25 days/) do
  days = page.all('.day')
  expect(days).to have(25).items
  expect(days.first).to have_text Date.today.strftime("%A %d %B %Y")
end

When(/^I click "Older posts"$/) do
  first('.pagination .next').click
end

Then(/^I see the previous 25 days$/) do
  days = page.all('.day')
  expect(days).to have(25).items
  expect(days.first).to have_text (Date.today - 25).strftime("%A %d %B %Y")
end

Given(/^I am viewing older posts$/) do
  step %{I am on the homepage}
  step %{I click "Older posts"}
  step %{I see the previous 25 days}
end

When(/^I click "Newer posts"$/) do
  first('.pagination .prev').click
end

Then(/^I see the more recent 25 days again$/) do
  step %{I see my most recent 25 days}
end
