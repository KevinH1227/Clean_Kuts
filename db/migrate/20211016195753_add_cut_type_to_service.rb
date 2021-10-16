class AddCutTypeToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :cut_type, :int
  end
end
