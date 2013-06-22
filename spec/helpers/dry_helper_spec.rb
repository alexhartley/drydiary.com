require 'spec_helper'

describe DryHelper do

  let (:user) { User.new(username: 'catface') }
  let (:day)  { Day.new(user: user, date: Date.new(2013, 6, 5)) }

  describe "#view_entry_path" do
    it 'builds the correct path for a given day' do
      helper.view_entry_path(day).should eq '/catface/2013/06/05'
    end
  end

  describe "#edit_entry_path" do
    it 'builds the correct path for a given day' do
      helper.edit_entry_path(day).should eq '/catface/2013/06/05/edit'
    end
  end

  describe "#tick_icon_class" do

    it "includes the 'ticked' class if the day is ticked" do
      day.ticked = true
      helper.tick_icon_class(day).should include ' ticked'
      helper.tick_icon_class(day).should_not include ' unticked'
    end

    it "includes the 'unticked' class if the day is not ticked" do
      day.ticked = false
      helper.tick_icon_class(day).should_not include ' ticked'
      helper.tick_icon_class(day).should include ' unticked'
    end

  end

  describe "#render_tick" do
    it 'renders the tick form if the day is owned by the current user' do
      helper.stub(current_user: user)
      helper.should_receive(:render).with('tick', day: day)
      helper.render_tick day
    end

    it 'renders a read only tick if the day is not owned by the current user' do
      helper.stub(current_user: User.new)
      helper.should_receive(:render).with('tick_read_only', day: day)
      helper.render_tick day
    end
  end

end
