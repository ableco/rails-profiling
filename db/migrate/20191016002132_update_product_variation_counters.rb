class UpdateProductVariationCounters < ActiveRecord::Migration[6.0]
  def up
    Variant.find_each do |variant|
      Variant.reset_counters(variant.id, :product_serie)
    end
  end
end
