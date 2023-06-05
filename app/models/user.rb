class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :registerable,
         :recoverable, :rememberable
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "should be a valid email address" }
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "should be 10 digits" }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
