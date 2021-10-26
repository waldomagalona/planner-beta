class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  validates :email, presence: true, uniqueness: {case_sensitive: false, message: "Email has already been used"}
  validates :password, presence: true
  validates_format_of :email,:with => Devise::email_regexp
end
