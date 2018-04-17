class Organization < ApplicationRecord
  validates :name, presence: true;
  validates :address, presence: true;
  has_many :contacts, dependent: :destroy
  has_many :missions
  belongs_to :user
  has_many :quotes
end
