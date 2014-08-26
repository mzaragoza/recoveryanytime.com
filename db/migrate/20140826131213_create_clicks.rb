class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :clickable_id
      t.string  :clickable_type   , default: ''
      t.integer :user_id
      t.string  :action           , default: ''

      t.timestamps
    end
  end
end
