class DryController < ApplicationController

  class Show < Fendhal::Action

    def action
      render locals: { user: user, days: days, day: day }
    end

    private

    def user
      @user ||= User.where(username: params[:id]).one
    end

    def day
      Day.where(date: Date.today).first || Day.new(date: Date.today)
    end

    def days
      user.days
    end

  end
end
