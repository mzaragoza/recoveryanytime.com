class EmailCampaingUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :email_campaing
  scope :is_opt_in, -> { where(:opt_in => true) }
end

