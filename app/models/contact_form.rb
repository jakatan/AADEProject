# frozen_string_literal: true

class ContactForm < ApplicationRecord
     validates :person_id, :email, :name, :message, presence: true
     has_many :officer
     has_many :person, through: :officer
end
