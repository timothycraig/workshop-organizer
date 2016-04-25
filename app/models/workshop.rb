class Workshop < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :date, presence: true
  validates :capacity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :abstract, presence: true, length: { minimum: 100, maximum: 1000 }

  scope :approved, -> { where(approved: true) }
end
