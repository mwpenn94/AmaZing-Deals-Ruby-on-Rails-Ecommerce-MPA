class Lineitem < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :cart, optional: true
    belongs_to :product, optional: true

    def total_price
        self.quantity.to_f * self.product.price.to_f
    end
end
