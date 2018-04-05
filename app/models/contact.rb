class Contact < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
end
