class CreateProductSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :product_series do |t|
      t.string :serie
      t.references :variant

      t.timestamps
    end
  end
end
