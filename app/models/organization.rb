class Organization < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :missions
  belongs_to :user
end
