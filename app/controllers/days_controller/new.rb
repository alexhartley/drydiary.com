class DaysController < ApplicationController
  class New < Fendhal::Action

    def action
      render locals: { day: day }
    end

    def day
      Day.new(date: params[:date])
    end

  end
end
