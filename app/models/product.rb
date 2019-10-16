class Product < ApplicationRecord
    belongs_to :brand
    has_many :variants
    
    has_many :ordered_variants, -> { order(:name) }, class_name: 'Variant'

    delegate :name, to: :brand, prefix:true
    
    def product_stocks
        items = ordered_variants.map do |variant|
            "<li> #{variant.name}: #{variant.product_series_count} </li>"
        end

        "<ul> #{items.join("")} </ul>".html_safe
    end
end
