class Task < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 300 }
  validates :status, inclusion: { in: ['done','not-started']}

  STATUS_OPTIONS = [['Not Started', 'not-started'],
                    ['Done', 'done']
                    ]
end
