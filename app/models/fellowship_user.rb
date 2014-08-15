class FellowshipUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :fellowship
  scope :is_opt_in, -> { where(:opt_in => true) }
end

