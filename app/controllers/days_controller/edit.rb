class DaysController < ApplicationController
  class Edit < Fendhal::Action

    def action
      render locals: { day: day }
    end

    def day
      Day.find(params[:id])
    end

  end
end
