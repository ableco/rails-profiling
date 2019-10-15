class ProductService
  include Godmin::Resources::ResourceService

  attrs_for_index :sku, :description, :brand_name, :product_stocks
  attrs_for_show :sku, :description
  attrs_for_form :sku, :description

  def per_page
    50
  end
end
