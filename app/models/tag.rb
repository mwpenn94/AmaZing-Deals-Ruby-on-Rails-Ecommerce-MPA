class Tag < ApplicationRecord
    has_many :products_tags
    has_many :taggings
    has_many :products, through: :taggings
    has_many :categories, through: :taggings

    validates :name, presence: true, 
                     uniqueness: true
end
