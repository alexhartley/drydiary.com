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

When(/^I edit the entry for that day$/) do
  within first('li.day') do
    click_on 'edit'
  end
  fill_in 'day_text', with: 'Narrowly avoided a whole bunch of catnip today :-s'
  click_on "Update Entry"
end

Then(/^The text I enter appears as part of the day$/) do
  within first('li.day') do
    page.should have_content "Narrowly avoided a whole bunch of catnip today :-s"
  end
end
