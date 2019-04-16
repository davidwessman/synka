class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")
    create_table :contacts, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :email, index: true, unique: true
      t.string :name
      t.string :phone, index: true
      t.string :address
      t.string :postal_code
      t.belongs_to :space, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
