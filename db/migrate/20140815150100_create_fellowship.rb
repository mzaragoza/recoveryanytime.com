class CreateFellowship < ActiveRecord::Migration
  def change
    create_table :fellowships do |t|
      t.string   :name        , default: ''
      t.text     :description , default: ''
      t.boolean  :active      , default: true
      t.string   :image       , default: ''

      t.timestamps
    end
  end
end
