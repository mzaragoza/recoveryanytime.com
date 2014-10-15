class AddAbbrToFellowship < ActiveRecord::Migration
  def change
    add_column :fellowships, :abbr, :string, default: ''
  end
end
