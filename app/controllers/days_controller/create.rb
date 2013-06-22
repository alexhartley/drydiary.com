class DaysController < ApplicationController
  class Create < Fendhal::Action

    def action
      day.save ? success : failure
    end

    private

    def success
      redirect_to success_url
    end

    def success_url
      request.referrer.match(/\/edit$/) ? '/' : :back
    end

    def failure
      render action: 'new'
    end

    def day
      @day ||= current_user.days.build(day_params)
    end

    def day_params
      params.require(:day).permit(:date, :text, :ticked)
    end

  end
end
