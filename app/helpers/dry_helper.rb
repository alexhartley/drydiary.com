module DryHelper

  def new_or_edit_day_path(day)
    if day.persisted? then edit_day_path(day)
    else new_day_path(day, date: day.date) end
  end

end
