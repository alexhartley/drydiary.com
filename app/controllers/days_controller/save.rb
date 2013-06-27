class DaysController < ApplicationController
  class Save < Fendhal::Action

    def action
      update_day and respond_to :json, :html
    end

    private

    def html
      redirect_to redirect_url
    end

    def json
      render json: { ordinal: current_user.consecutive_days.ordinalize }
    end

    def update_day
      day.update_attributes(day_params.merge(ticked: ticked?))
    end

    def redirect_url
      !tick_form? && request.referrer.match(/\/edit$/) ? '/' : :back
    end

    def tick_form?
      !params[:tick].nil?
    end

    def ticked?
      tick_form? ? !day.ticked : day.ticked
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
