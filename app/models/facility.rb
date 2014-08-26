class Facility < ActiveRecord::Base
  has_many :clicks, :as => :clickable

  scope :is_active, -> { where(:active => true) }

  scope :treatment,             -> { where(:type_of => 'treatment') }
  scope :detox,                 -> { where(:type_of => 'detox') }
  scope :sober_living,          -> { where(:type_of => 'sober_living') }
  scope :intensive_outpatient,  -> { where(:type_of => 'intensive_outpatient') }
  scope :interventionists,      -> { where(:type_of => 'interventionists') }
  scope :outpatient_detox,      -> { where(:type_of => 'outpatient_detox') }
  mount_uploader :image, PhotoUploader

  def add_to_views(options={})
    if options[:user_id]
      self.clicks.create( :user_id => options[:user_id], :action => 'view' )
    else
      self.clicks.create( :action => 'view' )
    end
    self.views = self.views  + 1
    self.save
  end
  def add_to_clicks
    if options[:user_id]
      self.clicks.create( :user_id => options[:user_id], :action => 'click' )
    else
      self.clicks.create( :action => 'click' )
    end
    self.clicks = self.clicks  + 1
    self.save
  end

end

