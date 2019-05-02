class AddUserAndSentAtToMessage < ActiveRecord::Migration[5.2]
  def change
    add_reference(:messages, :user, foreign_key: true, type: :uuid)
    add_column(:messages, :sent_at, :datetime)
  end
end
