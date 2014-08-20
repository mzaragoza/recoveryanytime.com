class Facility < ActiveRecord::Base

  scope :is_active, -> { where(:active => true) }

  scope :treatment,             -> { where(:type_of => 'treatment') }
  scope :detox,                 -> { where(:type_of => 'detox') }
  scope :sober_living,          -> { where(:type_of => 'sober_living') }
  scope :intensive_outpatient,  -> { where(:type_of => 'intensive_outpatient') }
  mount_uploader :image, PhotoUploader

  def add_to_views
    self.views = self.views  + 1
    self.save
  end
  def add_to_clicks
    self.clicks = self.clicks  + 1
    self.save
  end

end

