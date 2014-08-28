class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string   :first_name         , default: ''
      t.string   :last_name          , default: ''
      t.string   :email              , default: ''
      t.string   :phone              , default: ''
      t.text     :message            , default: ''
      t.text     :response_message   , default: ''

      t.timestamps
    end
  end
end
