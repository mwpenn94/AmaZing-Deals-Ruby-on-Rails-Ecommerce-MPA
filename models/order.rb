class Order < ApplicationRecord
    has_many :lineitems, dependent: :destroy
    has_many :products, through: :lineitems
    belongs_to :customer, :class_name => 'User', optional: true

#    scope :greater_or_equal_to_100_total, -> { where("total >= 100") }
#    after_create :email_user

#    def email_user
#      UserMailer.order_email(self).deliver
#    end        

    def sub_total
      sum = 0
      self.lineitems.each do |lineitem|
        sum+= lineitem.total_price
      end
      return sum
    end
end
