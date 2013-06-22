require 'markdown'

module DaysHelper

  def entry day
    if day.text.present?
      Markdown.render day.text
    else
      content_tag(:span, class: 'ghost') { ghost_text(day) }
    end
  end

  def ghost_text day
    if day.user == current_user
      "You haven't written anything for this day yet..."
    else
      "#{day.user.username} hasn't written anything for this day yet..."
    end
  end

end
