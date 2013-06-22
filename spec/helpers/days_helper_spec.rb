require 'spec_helper'

describe DaysHelper do

  let (:user) { User.new(username: 'catface') }
  let (:day)  { Day.new(user: user, date: Date.new(2013, 6, 5)) }

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
