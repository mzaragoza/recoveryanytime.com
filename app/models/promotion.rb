class Promotion < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :image
  validates_presence_of :link
  mount_uploader :image, PhotoUploader
  scope :is_active, -> { where(:active => true) }

  def add_to_views
    self.views = self.views  + 1
    self.save
  end
  def add_to_clicks
    self.clicks = self.clicks  + 1
    self.save
  end
end

