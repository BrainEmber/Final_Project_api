class Muser < ApplicationRecord
  has_many :ledgers
  has_many :fusers, through: :ledgers
  has_secure_password
end
