class Position < ApplicationRecord
  validates :position, :companyID, presence: true
  belongs_to :person
  belongs_to :company
end
