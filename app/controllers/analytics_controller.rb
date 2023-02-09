class AnalyticsController < ApplicationController
  def index
    @search_trends = Search.group(:query).order('count_id DESC').count(:id).first(10)

    @search_per_day = Search.group_by_day(:created_at).count
  end
end
