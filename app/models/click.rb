class Click < ActiveRecord::Base
  belongs_to :clickable, :polymorphic => true
  belongs_to :user

  scope :views,            -> { where(:action => 'view') }
  scope :clicks,          -> { where(:action => 'click') }
end

