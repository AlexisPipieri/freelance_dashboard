class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.integer :unit_price
      t.integer :quantity
      t.references :quote, foreign_key: true

      t.timestamps
    end
  end
end
