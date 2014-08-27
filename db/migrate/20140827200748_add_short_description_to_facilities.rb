class AddShortDescriptionToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :short_description, :text, default: ''
  end
end
