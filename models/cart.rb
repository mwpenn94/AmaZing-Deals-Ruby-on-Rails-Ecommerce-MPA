class Cart < ApplicationRecord
    has_many :lineitems, dependent: :destroy
    has_many :products, through: :lineitems

    def sub_total
        sum = 0
        self.lineitems.each do |lineitem|
          sum+= lineitem.total_price
        end
        return sum
    end
end
