class DaysController < ApplicationController
  before_filter :authenticate_user!

  def new
    New.new(self).action
  end

  def edit
    Edit.new(self).action
  end

  def create
    Create.new(self).action
  end

  def update
    Update.new(self).action
  end

end
