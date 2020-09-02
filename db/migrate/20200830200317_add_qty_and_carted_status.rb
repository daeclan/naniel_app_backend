class AddQtyAndCartedStatus < ActiveRecord::Migration[6.0]
  def change
    add_column :carted_products, :qty, :integer
    rename_column :carted_products, :status, :carted_status
  end
end
