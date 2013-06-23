class DryController < ApplicationController

  def index
    Index.new(self).action
  end

  def show
    Show.new(self).action
  end

end
