# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password

  has_many :expenses

  validates :email, presence: true, uniqueness: {message: "has been already taken"}, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
end
