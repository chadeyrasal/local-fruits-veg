class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.integer :quantity
      t.integer :user_id
    end
  end
end
