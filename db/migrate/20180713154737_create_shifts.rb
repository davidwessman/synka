class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.references :connection, foreign_key: true
      t.integer :day, default: 0, null: false
      t.time :from
      t.time :to

      t.timestamps
    end
  end
end
