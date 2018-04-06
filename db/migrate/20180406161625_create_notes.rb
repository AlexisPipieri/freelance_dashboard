class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :description
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
