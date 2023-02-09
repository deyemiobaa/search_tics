class SearchesController < ApplicationController
  def create
    search = Search.new(search_params)

    if !search.should_save?
      redirect_to root_path
      return
    end

    search = Search.update_similar_query(search.query, current_user.id)

    if search.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end
end
