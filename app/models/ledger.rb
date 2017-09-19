class Ledger < ApplicationRecord
  belongs_to :muser
  belongs_to :fuser
end
