class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.string :emission_date

      t.timestamps
    end
  end
end
