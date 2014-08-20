class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string   :name,               null: false, default: ""
      t.string   :image,              null: false, default: ""
      t.string   :link,               null: false, default: ""
      t.boolean  :active,             null: false, default: true
      t.integer  :views,              null: false, default: 0
      t.integer  :clicks,             null: false, default: 0

      t.timestamps
    end
  end
end
