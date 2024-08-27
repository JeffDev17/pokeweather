class HistoryController < ApplicationController
  def index
    sort_column = params[:sort] || 'created_at'
    sort_direction = params[:direction] || 'desc'
    @search_histories = SearchHistory.order("#{sort_column} #{sort_direction}")
  end
end
