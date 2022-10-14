class Alumni < ApplicationRecord
  validates :graduation_year, :companies_worked, :person_id, presence: true
  belongs_to :person
end