module AnswersHelper
    def user_id_field(answer)
        if answer.user.nil?
            select_tag "answer[user_id]", options_from_collection_for_select(User.all, :id, :username)
        else
            hidden_field_tag "answer[user_id]", answer.user_id
        end
    end

    def question_id_field(answer)
        if answer.question.nil?
            select_tag "answer[question_id]", options_from_collection_for_select(Question.all, :id, :name)
        else
            hidden_field_tag "answer[question_id]", answer.question_id
        end
    end  
end
