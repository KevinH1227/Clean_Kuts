class AddReviewToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :review, :string
  end
end
