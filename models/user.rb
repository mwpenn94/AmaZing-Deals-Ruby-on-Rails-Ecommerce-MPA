class User < ApplicationRecord
    has_many :orders, :foreign_key => 'customer_id'
    has_many :products, :foreign_key => 'seller_id'
    has_many :questions, :foreign_key =>  'customer_id'
    has_many :answers
    has_many :reviews, :foreign_key => 'customer_id'

    has_secure_password
#    after_create :email_user

    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i.freeze

  #  validates :username, presence: true,
  #                   uniqueness: true,
  #                   length: { minimum: 2 }
  #  validates :email, presence: true,
  #                   uniqueness: true,
  #                   format: EMAIL_REGEX
  #  validates :password, length: { in: 6..30 }

  #  def email_user
  #      UserMailer.order_email(self).deliver
  #  end    
end
