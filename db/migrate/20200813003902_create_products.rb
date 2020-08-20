class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image_url
      t.integer :user_id
      t.integer :cause_id
      t.boolean :active_status

      t.timestamps
    end
  end
end
