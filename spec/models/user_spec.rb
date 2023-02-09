require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user object' do
    it 'is valid with valid attributes' do
      user = User.create(email: 'test@mailer.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'is not valid without a email' do
      user = User.create(email: nil, password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.create(email: 'test@mailer.com', password: nil, password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it 'defaults to not being an admin' do
      user = User.create(email: 'test@mailer.com', password: 'password', password_confirmation: 'password')
      expect(user.admin?).to eq(false)
    end

    it 'can be made an admin' do
      user = User.create(email: 'test@mail.com', password: 'password', password_confirmation: 'password', admin: true)
      expect(user.admin?).to eq(true)
    end
  end
end
