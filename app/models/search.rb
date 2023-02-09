class Search < ApplicationRecord
  validates :query, presence: true, length: { minimum: 5 }
end
