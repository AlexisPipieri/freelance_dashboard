class CreateMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :missions do |t|
      t.string :start_date
      t.string :end_date
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
