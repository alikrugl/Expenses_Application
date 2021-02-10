class Subscriber < ApplicationRecord
    validates :sub_email,  format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
end