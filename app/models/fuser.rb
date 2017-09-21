class Fuser < ApplicationRecord
  has_many :ledgers
  has_many :musers, through: :ledgers
  has_secure_password
end
