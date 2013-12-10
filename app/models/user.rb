class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, format: { with: /@/, message: "You forgot the @ sign" }
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

end
