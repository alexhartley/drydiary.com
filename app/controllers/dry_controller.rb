class DryController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update]

  def index
    redirect_to action: :show, id: current_user.username if user_signed_in?
  end

  def show
    @user = User.where(username: params[:id]).one
    @day  = Day.where(date: Date.today).first || Day.new(date: Date.today)
    @days = @user.days
  end

  def create
    @day = current_user.days.build(day_params)
    if @day.save
      redirect_to '/', notice: 'Day was successfully created.'
    else
      render action: 'show', id: current_user.id
    end
  end

  def update
    if @day.user == current_user && @day.update(day_params)
      redirect_to '/', notice: 'Day was successfully updated.'
    else
      render action: 'show', id: current_user.id
    end
  end

  private

  def day_params
    params.require(:day).permit(:date, :text)
  end
end
