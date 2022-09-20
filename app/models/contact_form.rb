class ContactForm < ApplicationRecord
  validates :contactID, :email, :name, :message, presence: true
  has_many :officers
end
