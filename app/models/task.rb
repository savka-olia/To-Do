class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :details, presence: true, length: { in: 10..100, wrong_length:"Wrong number of characters!" }
end
