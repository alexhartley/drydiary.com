module DaysHelper

  def ghost_text day
    if day.user == current_user
      "You haven't written anything for this day yet..."
    else
      "#{day.user.username} hasn't written anything for this day yet..."
    end
  end

end
