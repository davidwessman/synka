class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.references :service, foreign_key: true
      t.integer :status, default: 0, null: false
      t.datetime :status_at, default: nil
      t.jsonb :data

      t.timestamps
    end
  end
end
