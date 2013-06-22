Given(/^today's date has no text$/) do
  first('li.day p').text.should be_empty
end

When(/^I choose to view the day$/) do
  within first('li.day') do
    click_on 'view'
  end
end

Then(/^I am told I haven't written anything yet$/) do
  page.should have_content "You haven't written anything for this day yet..."
end
