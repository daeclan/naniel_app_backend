class CreateCauses < ActiveRecord::Migration[6.0]
  def change
    create_table :causes do |t|
      t.string :name
      t.integer :goal
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end
end
