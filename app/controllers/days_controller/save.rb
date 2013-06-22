class DaysController < ApplicationController
  class Save < Fendhal::Action

    def action
      day.update_attributes(day_params) and redirect_to redirect_url
    end

    private

    def redirect_url
      !tick? && request.referrer.match(/\/edit$/) ? '/' : :back
    end

    def tick?
      !params[:tick].nil?
    end

    def day
      @day ||= Day.where(user: current_user, date: date).find_or_initialize_by
    end

    def date
      day_params.fetch(:date)
    end

    def day_params
      params.require(:day).permit(:date, :text, :ticked)
    end

  end
end
