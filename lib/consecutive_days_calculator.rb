class ConsecutiveDaysCalculator

  def initialize(user)
    @user = user
  end

  def calculate
    ticked_today? ? consecutive + 1 : consecutive
  end

  private

  def consecutive
    cursor.inject([yesterday, 0]) do |(current, count), day|
      return count unless day.date == current && day.ticked?
      [required.prev_day, count + 1]
    end.last
  end

  def ticked_today?
    user.today.ticked?
  end

  def cursor
    user.days.successful
  end

  def yesterday
    Date.yesterday
  end

  attr_reader :user
end
