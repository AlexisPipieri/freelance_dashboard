class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.string :date
      t.text :description
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
