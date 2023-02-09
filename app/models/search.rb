class Search < ApplicationRecord
  include StopwordsCheck
  validates :query, presence: true
  validates :user_id, presence: true

  belongs_to :user

  def should_save?
    query.length >= 7 && !end_with_stop_word?(query)
  end

  def self.update_similar_query(query, user_id)
    search = Search.where('user_id = ? AND word_similarity(query, ?) > 0.5', user_id, query).first

    if search
      if query.length > search.query.length
        search.update(query: query)
        return search
      end
    else
      Search.create(query: query, user_id: user_id)
    end
  end
end
