# frozen_string_literal: true

class ContactForm < ApplicationRecord
     validates :person_id, :email, :name, :message, presence: true
     has_one :person, through: :officer
     has_one :officer
end
