class SearchesController < ApplicationController
  def create
    search = Search.new(search_params)

    if !search.should_save?
      return
    end

    Search.update_similar_query(search.query, current_user.id)
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end
end
