class CreateEmailCampaingUsers < ActiveRecord::Migration
  def change
    create_table :email_campaing_users do |t|
      t.integer  :email_campaing_id
      t.integer  :user_id
      t.boolean  :opt_in,   null: false, default: true

      t.timestamps
    end
  end
end
