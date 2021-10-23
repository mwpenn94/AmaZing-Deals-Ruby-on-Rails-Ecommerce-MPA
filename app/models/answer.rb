class Answer < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :question, optional: true

    validates :name, presence: true
    validates :description, presence: true
end
