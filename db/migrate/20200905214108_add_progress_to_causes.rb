class AddProgressToCauses < ActiveRecord::Migration[6.0]
  def change
    add_column :causes, :progress, :integer
  end
end
