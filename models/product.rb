class Product < ApplicationRecord
    has_many :lineitems, dependent: :destroy
    has_many :orders, through: :lineitems
    has_many :taggings
    has_many :tags, through: :taggings
    has_many :questions
    has_many :answers
    has_many :reviews
    belongs_to :seller, :class_name => 'User'

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    
    before_save :set_seller_as_seller
    before_destroy :unset_seller_as_seller

    def average_review_rating
        reviews.average(:rating)
    end

    def self.tagged_with(name)
      Tag.find_by!(name: name).products
    end
    
    def self.tag_counts
      Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end
    
    def tag_list
      tags.map(&:name).join(', ')
    end
    
    def tag_list=(names)
      self.tags = names.split(',').map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end

    private

    def set_seller_as_seller
        unless self.seller.seller
            self.seller.update(:seller => true)
        end
    end

    def unset_seller_as_seller
        if self.seller.products.count <= 1
            self.seller.update(:seller => false)
        end
    end
end

