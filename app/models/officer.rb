class Officer < ApplicationRecord
  validates :person_id, :companyName, :company_website, presence: true
  has_many :person
end
