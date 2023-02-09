class CreateSearches < ActiveRecord::Migration[7.0]
  enable_extension 'pg_trgm'
  def change
    create_table :searches do |t|
      t.string :query
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    execute "CREATE INDEX index_searches_on_query ON searches USING GIN (query gin_trgm_ops)"
  end
end
