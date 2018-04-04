class Organization < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :missions
end
