class Muser < ApplicationRecord
  has_many :ledgers
  has_many :fusers, through: :ledgers
end
