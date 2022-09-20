class Alumni < ApplicationRecord
  validates :graduations_year, :companies_worked, :companyID, presence: true
  has_many :people
  has_one :company
end
