class HomepageController < ApplicationController
  def index
    @search = Search.new
  end
end
