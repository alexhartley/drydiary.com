class DryController < ApplicationController
  class Index < Fendhal::Action

    def action
      user_signed_in? ? diary : registration
    end

    def diary
      redirect_to action: :show, username: current_user.username
    end

    def days
      Day.range(1.week.ago.to_date, Date.today).with_text
    end

    def registration
      redirect_to new_user_registration_path
    end

  end
end
