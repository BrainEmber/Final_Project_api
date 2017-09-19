class Fuser < ApplicationRecord
  has_many :ledgers
  has_many :musers, through: :ledgers
end
