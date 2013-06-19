module DryHelper

  def new_or_edit_day_path(day)
    if day.persisted? then edit_day_path(day)
    else new_day_path(day, date: day.date) end
  end

  def tick_icon(day)
    if day.ticked? then 'pull-right tick ticked'
    else 'pull-right tick unticked' end
  end
end
