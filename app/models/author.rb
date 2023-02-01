class Author < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :phone_number, length: { is: 10, message: "%{value} Should be 10 digits, everyone knows you big dummy!" }
end
