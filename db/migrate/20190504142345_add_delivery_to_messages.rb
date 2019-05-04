class AddDeliveryToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column(:messages, :delivery, :jsonb)
    rename_column(:messages, :sent_at, :processed_at)
  end
end
