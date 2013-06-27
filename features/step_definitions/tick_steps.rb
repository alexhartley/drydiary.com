Given(/^today's date is unticked$/) do
  page.should have_text 'catface is on their 0th day without catnip'
  within first('li.day') do
    page.should have_selector '.unticked'
  end
end

Given(/^today's date is ticked$/) do
  step "I tick it"
  page.should have_text 'catface is on their 1st day without catnip'
  within first('.tick-box') do
    page.should have_selector '.ticked'
  end
end

When(/^I (?:untick|tick) it$/) do
  first('.tick').click
end

Then(/^it goes green$/) do
  within first('.tick-box') do
    page.should have_selector '.ticked'
  end
end

Then(/^it goes back to being grey/) do
  within first('.tick-box') do
    page.should have_selector '.unticked'
  end
end

Then(/^my day count increases by one$/) do
  page.should have_text 'catface is on their 1st day without catnip'
end

Then(/^my day count decreases by one$/) do
  page.should have_text 'catface is on their 0th day without catnip'
end

Given(/^I am editing a ticked diary entry$/) do
  within first('li.day') do
    first('.tick').click
    click_on 'edit'
  end
  first('.tick')['class'].should include ' ticked'
  fill_in 'wmd-input', with: 'The desire for catnip is starting to loosen its grip'
end

Given(/^I am editing an unticked diary entry$/) do
  within first('li.day') do
    click_on 'edit'
  end
  first('.tick')['class'].should include ' unticked'
  fill_in 'wmd-input', with: 'The desire for catnip is starting to loosen its grip'
end

Then(/^I am still on the edit screen$/) do
  page.should have_text 'The desire for catnip is starting to loosen its grip'
end
