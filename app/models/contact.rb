class Contact < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  has_many :actions, dependent: :destroy
end
