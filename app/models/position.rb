class Position < ApplicationRecord
  validates :position, :company_id, :person_id, presence: true
  belongs_to :person
  belongs_to :company
end