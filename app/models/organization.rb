class Organization < ApplicationRecord
  validates :name, presence: true;
  validates :address, presence: true;
  has_many :contacts
  belongs_to :user
  has_many :quotes
end
