class CreateEmailCampaing < ActiveRecord::Migration
  def change
    create_table :email_campaings do |t|
      t.string   :name,     null: false, default: ""
      t.string   :list_id,  null: false, default: ""
      t.boolean  :active,   null: false, default: true

      t.timestamps
    end
  end
end
