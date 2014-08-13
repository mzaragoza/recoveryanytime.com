class EmailCampaing < ActiveRecord::Base
  has_many :email_campaing_users

  scope :is_active, -> { where(:active => true) }
end

