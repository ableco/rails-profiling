class AddProductSeriesCountToVariant < ActiveRecord::Migration[6.0]
  def change
    add_column :variants, :product_series_count, :integer, default: 0
  end
end
