class Promotion < ActiveRecord::Base
  has_many :clicks, :as => :clickable

  validates_presence_of :name
  #validates_presence_of :image
  validates_presence_of :link
  mount_uploader :image, PhotoUploader
  scope :is_active, -> { where(:active => true) }

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
      self.clicks.create( :action => 'click' , :referer => options[:referer])
    end
  end

end

