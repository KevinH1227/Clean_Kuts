class RemoveServiceTypeFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :service_type, :string
  end
end
