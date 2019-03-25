class CreateProductUnits < ActiveRecord::Migration
  def change
    create_table :product_units do |t|
      t.string :name
    end
  end
end
