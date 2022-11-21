class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :availability, default: true
      t.integer :maximum_number
      t.string :price_range

      t.timestamps
    end
  end
end
