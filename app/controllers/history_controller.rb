class HistoryController < ApplicationController
  def index
    @search_histories = SearchHistory.all
  end
end
