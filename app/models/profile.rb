class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :biography, length: { maximum: 1500 }

  # mount_uploader :avatar_url, ImageUploader
  #
  # validates_processing_of :avatar_url
  # validate :avatar_url_size_validation
  #
  # private
  #
  # def avatar_url_size_validation
  #   errors[:avatar_url] << "should be less than 500KB" if avatar_url.size > 0.5.megabytes
  # end
end
