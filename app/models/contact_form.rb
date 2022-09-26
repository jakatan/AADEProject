class ContactForm < ApplicationRecord
  validates :person_id, :email, :name, :message, presence: true
  has_many :officers
end
