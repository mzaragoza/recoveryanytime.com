class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string   :name,                      null: false, default: ""
      t.integer  :fellowship_id
      t.string   :location,                  null: false, default: ""
      t.string   :address,                   null: false, default: ""
      t.string   :city,                      null: false, default: ""
      t.string   :state,                     null: false, default: ""
      t.string   :zip,                       null: false, default: ""
      t.string   :format,                    null: false, default: ""
      t.string   :language,                  null: false, default: ""
      t.datetime :meeting_time
      t.text     :description
      t.boolean  :hadicapped_accessable,     null: false, default: true

      t.timestamps
    end
  end
end
