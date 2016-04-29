class Workshop < ActiveRecord::Base
  belongs_to :user
  has_many :user_workshops
  has_many :users, through: :user_workshops

  validates :title, presence: true
  validates :date, presence: true
  validates :capacity, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :abstract, presence: true, length: { minimum: 100, maximum: 1500 }

  scope :approved, -> { where(approved: true) }
end
