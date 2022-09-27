class Officer < ApplicationRecord
  validates :person_id, :position, :email, :year_elected, :description, :photo, presence: true
  belongs_to :person
  has_many :contact_forms
end