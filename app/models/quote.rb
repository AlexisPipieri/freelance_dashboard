class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :tasks, dependent: :destroy
end
