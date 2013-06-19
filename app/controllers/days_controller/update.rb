class DaysController < ApplicationController
  class Update < Fendhal::Action

    def action
      day.update_attributes(day_params) ? success : failure
    end

    private

    def success
      redirect_to '/'
    end

    def failure
      render action: 'edit'
    end

    def day
      @day ||= Day.find(params[:id])
    end

    def day_params
      params.require(:day).permit(:date, :text)
    end

  end
end