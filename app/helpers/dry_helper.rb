module DryHelper

  def new_or_edit_day_path(day)
    if day.persisted? then edit_day_path(day)
    else new_day_path(day, date: day.date) end
  end

  def tick_icon_class(day)
    if day.ticked? then 'pull-right tick ticked'
    else 'pull-right tick unticked' end
  end

  def render_tick(day)
    render (current_user == day.user ? 'tick' : 'tick_read_only'), day: day
  end

end
