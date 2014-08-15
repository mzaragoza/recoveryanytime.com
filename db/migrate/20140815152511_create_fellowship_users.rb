class CreateFellowshipUsers < ActiveRecord::Migration
  def change
    create_table :fellowship_users do |t|
      t.integer  :fellowship_id
      t.integer  :user_id
      t.boolean  :opt_in,   null: false, default: true

      t.timestamps
    end
  end
end
