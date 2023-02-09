require 'rails_helper'

RSpec.describe Search, type: :model do
  let (:user) { User.create(email: 'joe@mailer.com', password: 'password', password_confirmation: 'password') }

  describe 'search object' do
    it 'is valid with valid attributes' do
      search = Search.create(query: 'what is a test?', user_id: user.id)
      expect(search).to be_valid
    end

    it 'should return false if query is less than 7 characters' do
      search = Search.new(query: 'what', user_id: user.id)
      expect(search.should_save?).to eq(false)
    end

    it 'should return false if query ends with a stop word' do
      search = Search.new(query: 'what is a', user_id: user.id)
      expect(search.should_save?).to eq(false)
    end

    it 'should return true if query is greater than 7 characters and does not end with a stop word' do
      search = Search.new(query: 'what is a test', user_id: user.id)
      expect(search.should_save?).to eq(true)
    end

    it 'should update the query if the new query is longer than the old query' do
      search = Search.create(query: 'what is a test', user_id: user.id)
      search = Search.update_similar_query('what is a test of a search', user.id)
      expect(search.query).to eq('what is a test of a search')
    end
  end
end
