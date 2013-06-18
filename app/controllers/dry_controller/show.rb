class DryController < ApplicationController

  class Show < Fendhal::Action

    def action
      render locals: { user: user, days: days }
    end

    private

    def user
      @user ||= User.where(username: params[:id]).one
    end

    def days
      (Date.today).downto(user.created_at.to_date).collect do |date|
        days_dictionary.fetch(date) { user.days.build(date: date) }
      end
    end

    def existing_days
      user.days
    end

    def days_dictionary
      @days_dictionary ||= existing_days.reduce({}) do |acc, day|
        acc.merge(day.date => day)
      end
    end

  end
end
