class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string   :type_of             , default: ""
      t.string   :name                , default: ""
      t.string   :address             , default: ""
      t.string   :city                , default: ""
      t.string   :state               , default: ""
      t.string   :zip                 , default: ""
      t.text     :description         , default: ""
      t.string   :contact_name        , default: ""
      t.string   :contact_email       , default: ""
      t.string   :contact_phone       , default: ""
      t.string   :image               , default: ""
      t.string   :link                , default: ""
      t.boolean  :active              , default: true
      t.boolean  :main,               null: false, default: false
      t.integer  :position,           null: false, default: 0
      t.integer  :views,              null: false, default: 0
      t.integer  :clicks,             null: false, default: 0
      t.timestamps
    end
  end
end
