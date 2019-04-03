class User < ApplicationRecord
  has_many :orders
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :phone, length: { in: 9..12 }
  validates :password, length: { in: 8..12 }
  validates :password, format: { with: /^[A-Za-z0-9]+$/ }
end 
