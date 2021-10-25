module ProductsHelper
    def seller_id_field(product)
        if product.seller.nil?
            select_tag "product[seller_id]", options_from_collection_for_select(User.all, :id, :username)
        else
            hidden_field_tag "product[seller_id]", product.seller_id
        end
    end 
end
