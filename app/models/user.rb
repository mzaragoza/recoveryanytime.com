class User < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :email_campaing_users
  has_many :email_campaings , through: :email_campaing_users
  has_many :fellowship_users
  has_many :fellowships , through: :fellowship_users
  validates_uniqueness_of :username

  scope :is_active, -> { where(:active => true) }
  attr_accessor :updating_password
  mount_uploader :photo, PhotoUploader

  def full_address
    (self.address + ' ' + self.city + ' ' + self.state + ' ' + self.zip ).titleize
  end
  def name
    full_name
  end

  def full_name
    (self.first_name + ' ' + self.last_name).titleize
  end

  def sober_ago
    if self.sober_date
      Time.diff(DateTime.now, self.sober_date)[:diff]
    else
      'N/A'
    end
  end
  def should_validate_password?
    updating_password || new_record?
  end
end
