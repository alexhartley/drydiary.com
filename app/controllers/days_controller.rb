class DaysController < ApplicationController
  before_filter :set_day, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:create, :update, :destroy]

  # GET /days
  def index
    @user = User.where(username: params[:username]).one
    @days = @user.days
    @day  = Day.where(date: Date.today).first || Day.new(date: Date.today)
  end

  # GET /days/1
  def show
  end

  # GET /days/new
  def new
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days
  def create
    @day = current_user.days.build(day_params)

    if @day.save
      redirect_to '/', notice: 'Day was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /days/1
  def update
    if @day.user == current_user && @day.update_attributes(day_params)
      redirect_to '/', notice: 'Day was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /days/1
  def destroy
    if @day.user == current_user
      @day.destroy
      redirect_to '/', notice: 'Day was successfully destroyed.'
    else
      render action: 'edit'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_day
    @day = Day.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def day_params
    params.require(:day).permit(:date, :text)
  end
end
