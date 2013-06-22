module DryHelper

  def edit_entry_path(day)
    "/#{day.user.username}/#{day.date.strftime "%Y/%m/%d/edit"}"
  end

  def view_entry_path(day)
    "/#{day.user.username}/#{day.date.strftime "%Y/%m/%d"}"
  end

  def tick_icon_class(day)
    "pull-right tick #{day.ticked? ? 'ticked' : 'unticked'}"
  end

  def render_tick(day)
    render (current_user == day.user ? 'tick' : 'tick_read_only'), day: day
  end

end
