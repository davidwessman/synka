class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :kind, default: 0, null: false
      t.string :remote_uid
      t.datetime :active, default: nil

      t.timestamps
    end
  end
end
