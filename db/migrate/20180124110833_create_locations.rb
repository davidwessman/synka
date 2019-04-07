class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")
    create_table :locations, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.integer :status, default: 0, null: false
      t.datetime :status_at
      t.timestamps
    end
  end
end
