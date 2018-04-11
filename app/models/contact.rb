class Contact < ApplicationRecord
  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :email, format: { with: Devise.email_regexp, message: "email non valide" }

  belongs_to :organization, optional: true
  belongs_to :user
  has_many :actions, dependent: :destroy
  has_many :notes, dependent: :destroy

  include PgSearch
    pg_search_scope :search_contact,
                    ignoring: :accents,
      against: [ :first_name, :last_name ],
      associated_against: {
        organization: [ :name ]
      },
      using: {
        tsearch: { prefix: true }
      }
end
