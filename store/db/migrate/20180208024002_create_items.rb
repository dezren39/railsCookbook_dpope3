class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :in_stock, default: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
