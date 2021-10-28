class RemoveRecipientIdFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :messages, :recipient, null: false, foreign_key: { to_table: :users }
  end
end
