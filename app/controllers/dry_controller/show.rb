class DryController < ApplicationController

  class Show < Fendhal::Action

    def action
      respond_to :html
    end

    private

    def html
      render locals: { user: user, days: days }
    end

    def user
      @user ||= User.where(username: params[:username]).one
    end

    def offset
      @offset ||= (params.fetch(:page, 1).to_i - 1) * 25
    end

    def days
      (Date.today - offset).downto(Date.today - offset - 24).map do |date|
        user.days.where(date: date).find_or_initialize_by
      end
    end

  end
end
