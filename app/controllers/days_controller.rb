class DaysController < ApplicationController
  before_filter :authenticate_user!

  def edit
    Entry.new(self).action
  end

  def show
    Entry.new(self).action
  end

  def create
    Save.new(self).action
  end

  def update
    Save.new(self).action
  end

end
