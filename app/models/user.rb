class User < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: true
    has_many :transactions
    has_many :goals

end
