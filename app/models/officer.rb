class Officer < ApplicationRecord
  validates :companyID, :companyName, :company_website, presence: true
  has_many :person
  belongs_to :contact_form
end
