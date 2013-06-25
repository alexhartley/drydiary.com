Given(/^today's date has no text$/) do
  first('li.day p').should_not be_present
end

When(/^I choose to view the day$/) do
  within first('li.day') do
    click_on 'view'
  end
end

Then(/^I am told I haven't written anything yet$/) do
  page.should have_content "You haven't written anything for this day yet..."
end

When(/^I add an entry for that day$/) do
  within first('li.day') do
    click_on 'edit'
  end
  fill_in 'wmd-input', with: 'Narrowly avoided a whole bunch of catnip today :-s'
  click_on "Update Entry"
end

Then(/^The text I enter appears as part of the day$/) do
  within first('li.day') do
    page.should have_content "Narrowly avoided a whole bunch of catnip today :-s"
  end
end

Given(/^I have already made an entry for today$/) do
  steps %{
    * I add an entry for that day
    * The text I enter appears as part of the day
  }
end

When(/^I edit the entry for that day$/) do
  within first('li.day') do
    click_on 'edit'
  end
  fill_in 'wmd-input', with: 'The temptation of catnip was strong but I resisted'
  click_on "Update Entry"
end

Then(/^The new text I have entered appears as part of the day$/) do
  within first('li.day') do
    page.should have_content "The temptation of catnip was strong but I resisted"
    page.should_not have_content "Narrowly avoided a whole bunch of catnip today :-s"
  end
end

Given(/^I edit a ticked day$/) do
  steps %{
    * today's date is ticked
    * I edit the entry for that day
  }
end

Then(/^The day remains ticked$/) do
  page.should have_selector '.ticked'
end
