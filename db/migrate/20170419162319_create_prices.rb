class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.decimal :price
      t.decimal :product_id

      t.timestamps
    end
  end
end
