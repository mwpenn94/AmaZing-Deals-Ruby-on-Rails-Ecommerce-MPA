class Question < ApplicationRecord
    belongs_to :customer, :class_name => 'User'
    belongs_to :product
    has_many :answers

    validates :name, presence: true
    validates :description, presence: true
end
