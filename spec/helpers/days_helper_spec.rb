require 'spec_helper'

describe DaysHelper do

  let (:user) { User.new(username: 'catface') }
  let (:day)  { Day.new(user: user, date: Date.new(2013, 6, 5)) }

  describe "#entry" do

    it 'renders the entry markdown if it exists' do
      day.text = "Hello, *cat*"
      helper.entry(day).should eq "<p>Hello, <em>cat</em></p>\n"
    end

    it 'renders the ghost text if no text exists' do
      day.text = ""
      helper.stub(current_user: user)
      helper.entry(day).should eq '<span class="ghost">You haven&#39;t written anything for this day yet...</span>'
    end

  end

  describe "#ghost_text" do

    it 'is in the second person if the day belongs to the current user' do
      helper.stub(current_user: user)
      helper.ghost_text(day).should eq "You haven't written anything for this day yet..."
    end

    it 'is in the third person if the day does not belong to the current user' do
      helper.stub(current_user: User.new)
      helper.ghost_text(day).should eq "catface hasn't written anything for this day yet..."
    end
  end

end
