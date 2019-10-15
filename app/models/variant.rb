class Variant < ApplicationRecord
    belongs_to :product
    has_many :product_serie
end
