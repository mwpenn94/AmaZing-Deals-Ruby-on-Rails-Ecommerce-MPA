module CategoriesHelper
    def department_id_field(category)
        if category.department.nil?
            select_tag "category[department_id]", options_from_collection_for_select(Department.all, :id, :name)
        else
            hidden_field_tag "category[department_id]", category.department_id
        end
    end 
end
