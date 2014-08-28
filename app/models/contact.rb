class Contact < ActiveRecord::Base

  def name
    full_name
  end

  def full_name
    (self.first_name + ' ' + self.last_name).titleize
  end
end

