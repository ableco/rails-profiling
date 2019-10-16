class ProductSerie < ApplicationRecord

  belongs_to :variant, counter_cache: true

end
