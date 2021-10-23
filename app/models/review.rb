class Review < ApplicationRecord
    belongs_to :customer, :class_name => 'User', optional: true
    belongs_to :product, optional: true

    validates :title, presence: true 
    validates :description, presence: true
    validates :rating, presence: true, numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 5,
              only_integer: true
            }   
end
