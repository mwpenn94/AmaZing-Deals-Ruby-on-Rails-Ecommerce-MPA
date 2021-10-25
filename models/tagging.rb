class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :product, optional:true
  belongs_to :category, optional: true
end
