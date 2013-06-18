class DryController < ApplicationController

  def index
    redirect_to action: :show, id: current_user.username if user_signed_in?
  end

  def show
    Show.new(self).action
  end

end
