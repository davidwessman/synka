class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.references :location, index: true, foreign_key: true, type: :uuid
      t.references :service, foreign_key: true
      t.string :remote_uid, default: 0, null: false
      t.timestamps
    end
  end
end
