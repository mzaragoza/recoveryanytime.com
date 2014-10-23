class Meeting < ActiveRecord::Base
  belongs_to :fellowship
  before_validation { |meeting| meeting.state = state.downcase }

  def full_address
    (self.address    + ' ' + self.city + ' ' + self.state + ' ' + self.zip ).titleize
  end
end

