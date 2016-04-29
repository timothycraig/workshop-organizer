class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :biography, length: { maximum: 1500 }
  validates_format_of :linkedin_url, with: URI::regexp(%w(http https)), allow_blank: true
  validates_format_of :twitter_url, with: URI::regexp(%w(http https)), allow_blank: true
end
