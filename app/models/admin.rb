class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :is_active, -> { where(:active => true) }
  attr_accessor :updating_password
  mount_uploader :photo, PhotoUploader



  def name
    full_name
  end

  def full_name
    (self.first_name + ' ' + self.last_name).titleize
  end

  def should_validate_password?
    updating_password || new_record?
  end
end
