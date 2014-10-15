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
      self.clicks.create( :user_id => options[:user_id], :action => 'view', :referer => options[:referer] )
    else
      self.clicks.create( :action => 'view', :referer => options[:referer] )
    end
  end
  def add_to_clicks(options={})
    if options[:user_id]
      self.clicks.create( :user_id => options[:user_id], :action => 'click', :referer => options[:referer] )
    else
      self.clicks.create( :action => 'click', :referer => options[:referer] )
    end
  end

  def views_count
    self.clicks.where(action: 'view').count
  end
  def views_count_this_month
    self.clicks.where(action: 'view').where(:created_at => Date.today.beginning_of_month..Date.today.end_of_month).count
  end
  def clicks_count
    self.clicks.where(action: 'click').count
  end
  def views_count_this_month
    self.clicks.where(action: 'click').where(:created_at => Date.today.beginning_of_month..Date.today.end_of_month).count
  end
end

