class Mission < ApplicationRecord
  belongs_to :organization
  has_many :quotes
end
