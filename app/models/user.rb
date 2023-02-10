class User < ApplicationRecord
  has_many :searches, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    admin == true
  end
end
