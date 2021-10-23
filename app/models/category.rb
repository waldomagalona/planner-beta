class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates :name, presence: true, uniqueness: {case_sensitive: false, message: "Category name has already been used"}, length: { maximum: 100 }
  validates :description, presence:true, length: { maximum: 2000 }
end
