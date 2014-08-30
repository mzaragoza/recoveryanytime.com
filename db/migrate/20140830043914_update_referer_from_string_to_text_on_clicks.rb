class UpdateRefererFromStringToTextOnClicks < ActiveRecord::Migration
  def change
    change_column :clicks, :referer, :text
  end
end
