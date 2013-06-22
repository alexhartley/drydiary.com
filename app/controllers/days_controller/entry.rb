class DaysController < ApplicationController
  class Entry < Fendhal::Action

    def action
      render locals: { day: day }
    end

    def user
      @user ||= User.where(username: params[:username]).one
    end

    def day
      user.days.where(date: date).find_or_initialize_by
    end

    def date
      @date ||= Date.parse("#{params[:year]}/#{params[:month]}/#{params[:day]}")
    end

  end
end
