class Secret < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true
  validates :title, length: { in: 3..50}
  validates :body, length: { minimum: 10}
end
