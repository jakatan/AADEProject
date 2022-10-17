class Company < ApplicationRecord
  validates :company_website, :companyName, presence: true
  has_many :positions

end
