class UserWorkshop < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop

  validates :user_id, presence: true
  validates :workshop_id, presence: true
end
