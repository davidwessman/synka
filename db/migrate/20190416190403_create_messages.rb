class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")
    create_table :messages, id: :uuid, default: "gen_random_uuid()" do |t|
      t.belongs_to :contact, foreign_key: true, type: :uuid
      t.text :content, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
