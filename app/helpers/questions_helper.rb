module QuestionsHelper
    def question_customer_id_field(question)
        if question.customer.nil?
            select_tag "question[customer_id]", options_from_collection_for_select(User.all, :id, :username)
        else
            hidden_field_tag "question[customer_id]", question.customer_id
        end
    end

    def question_product_id_field(question)
        if question.product.nil?
            select_tag "question[product_id]", options_from_collection_for_select(Product.all, :id, :name)
        else
            hidden_field_tag "question[product_id]", question.product_id
        end
    end  
end
