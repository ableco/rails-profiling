require 'faker'

brands = []
50.times do |i|
    brands << { name: Faker::Device.manufacturer, created_at: 4.days.ago, updated_at: 3.days.ago }
end
Brand.insert_all!(brands)

puts "Brands: #{brands.size}"

products = []
500.times do |i|
    products << {description: Faker::Device.model_name, sku: Faker::Code.asin, brand_id: rand(1..50), created_at: 4.days.ago, updated_at: 3.days.ago}
end
product_ids = Product.insert_all!(products).rows.flatten

puts "Products: #{products.size}"

variants = []
product_ids.each do |product_id|
  rand(4..10).times { variants << { name: Faker::Color.color_name, product_id: product_id, created_at: rand(4..30).days.ago, updated_at: 3.days.ago } }
end
variant_ids = Variant.insert_all!(variants).rows.flatten

puts "Variants: #{variants.size}"


variant_ids.each_slice(1000) do |batch| 
    series = []
    batch.each { |variant_id| rand(4..30).times { series << { serie: Faker::Device.serial, variant_id: variant_id, created_at: rand(4..30).days.ago, updated_at: 3.days.ago } } }
    ProductSerie.insert_all!(series)
end

puts "Series: #{ProductSerie.count}"