class RemoveTitleAndDateFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :title, :string
    remove_column :reviews, :date, :datetime
  end
end
