class AddUserIdToCauses < ActiveRecord::Migration[6.0]
  def change
    add_column :causes, :user_id, :integer
  end
end
