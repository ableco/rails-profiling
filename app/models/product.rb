class Product < ApplicationRecord
    belongs_to :brand
    has_many :variants

    delegate :name, to: :brand, prefix:true
    
    def product_stocks
        items = variants.order(:name).map do |variant|
            "<li> #{variant.name}: #{variant.product_series_count} </li>"
        end

        "<ul> #{items.join("")} </ul>".html_safe
    end
end
