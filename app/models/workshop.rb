class Workshop < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true
  validates :capacity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :abstract, presence: true, length: { minimum: 1, maximum: 1000 }
end
