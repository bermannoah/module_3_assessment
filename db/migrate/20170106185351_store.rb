class Store < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :long_name
      t.string :city
      t.string :distance
      t.string :phone_number
      t.string :store_type
      
      t.timestamps
    end
  end
end
