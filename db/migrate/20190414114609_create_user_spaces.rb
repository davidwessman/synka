class CreateUserSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :user_spaces do |t|
      t.belongs_to :user, foreign_key: true, type: :uuid
      t.belongs_to :space, foreign_key: true, type: :uuid
      t.index [:user_id, :space_id], unique: true

      t.timestamps
    end
  end
end
