class UserWorkshop < ActiveRecord::Base
  belongs_to :user
  belongs_to :workshop
end
