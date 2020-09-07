class AddPrimaryCauseToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :primary_cause, :string
  end
end
