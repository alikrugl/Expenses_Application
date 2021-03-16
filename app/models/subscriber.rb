class Subscriber < ApplicationRecord
    def check_equals
        errors.add(:email, "is yours. ") if email == sub_email
    end

    def check_sub_email
        errors.add(:email, "does not exist") if !User.find_by(email: sub_email)
    end

    #validates :sub_email,  format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
    validates :email, uniqueness: { scope: :sub_email, message:" already shared" }
    validate :check_equals
    validate :check_sub_email
end
