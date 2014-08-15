class Fellowship < ActiveRecord::Base

  has_many :fellowship_users
  has_many :users , through: :fellowship_users
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
end

