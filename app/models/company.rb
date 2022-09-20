class Company < ApplicationRecord
  validates :companyID, :companyName, presence: true
  has_many :positions

end
