class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4 }
  validates :details, length: { in: 6..200 }
end
