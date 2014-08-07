class AddSoberDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :sober_date, :date
    add_column :users, :birthday, :date
    add_column :users, :active, :boolean, default: true
  end
end
