class CreateSpace < ActiveRecord::Migration[5.2]
  def change
    enable_extension("pgcrypto") unless extension_enabled?("pgcrypto")
    create_table :spaces, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :title
      t.string :slug, unique: true, index: true
      t.timestamps
    end
  end
end
