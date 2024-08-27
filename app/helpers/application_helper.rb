module ApplicationHelper
  def sort_direction(column)
    column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
  end
end