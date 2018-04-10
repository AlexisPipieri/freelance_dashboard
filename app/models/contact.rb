class Contact < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  has_many :actions, dependent: :destroy
  has_many :notes, dependent: :destroy

  include PgSearch
    pg_search_scope :global_search,
      against: [ :first_name, :last_name ],
      associated_against: {
        organization: [ :name ]
      },
      using: {
        tsearch: { prefix: true }
      }
end
