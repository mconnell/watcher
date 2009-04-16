# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_date(date)
    h(date.strftime("%d/%m/%Y")) if date.present?
  end
  alias_method :d, :render_date

end
