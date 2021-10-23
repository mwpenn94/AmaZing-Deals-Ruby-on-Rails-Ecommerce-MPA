module ReviewsHelper
    def review_customer_id_field(review)
        if review.customer.nil?
            select_tag "review[customer_id]", options_from_collection_for_select(User.all, :id, :username)
        else
            hidden_field_tag "review[customer_id]", review.customer_id
        end
    end

    def review_product_id_field(review)
        if review.product.nil?
            select_tag "review[product_id]", options_from_collection_for_select(Product.all, :id, :name)
        else
            hidden_field_tag "review[product_id]", review.product_id
        end
    end  
end
