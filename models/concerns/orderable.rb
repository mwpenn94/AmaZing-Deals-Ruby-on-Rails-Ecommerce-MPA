module Orderable
    extend ActiveSupport::Concern
 
   def inventory
     products.merge(Product.available)
   end
 
   def ratio_orders_to_products
     if products.count > 0
       orders.count.to_f / products.count.to_f
     end
   end
 
   class_methods do
     # use of 'class_methods' is good, but I think is something that the curriculum 
     # does not currently cover, so would need to be added.
     def highest_ratio_orders_to_products
 
       all.max do |a, b|
         a.ratio_orders_to_products <=> b.ratio_orders_to_products
       end
     end
 
     def most_orders
       all.max do |a, b|
         a.orders.count <=> b.orders.count
       end
     end
   end
 end