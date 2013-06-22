Given(/^today's date is unticked$/) do
  page.should have_text 'catface is on their 0th day without catnip'
  within first('li.day') do
    page.should have_selector '.unticked'
  end
end

Given(/^today's date is ticked$/) do
  step "I tick it"
  page.should have_text 'catface is on their 1st day without catnip'
  within first('li.day') do
    page.should have_selector '.ticked'
  end
end

When(/^I (?:untick|tick) it$/) do
  within page.first('li.day') do
    first('.tick').click
  end
end

Then(/^it goes green$/) do
  within first('li.day') do
    should have_selector '.ticked'
  end
end

Then(/^it goes back to being grey/) do
  within first('li.day') do
    should have_selector '.unticked'
  end
end

Then(/^my day count increases by one$/) do
  page.should have_text 'catface is on their 1st day without catnip'
end

Then(/^my day count decreases by one$/) do
  page.should have_text 'catface is on their 0th day without catnip'
end
