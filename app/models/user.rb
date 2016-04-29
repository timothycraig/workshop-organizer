class User < ActiveRecord::Base
  has_one :profile
  has_many :user_workshops
  has_many :workshops, through: :user_workshops

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :build_default_profile

  include PgSearch
  pg_search_scope :search,
    against: [
      :first_name,
      :last_name,
      :email
    ],
    using: {
      tsearch: { prefix: true, dictionary: "english" }
    }

  def admin?
    role == "admin"
  end

  private

  def build_default_profile
    build_profile
    true
  end
end
