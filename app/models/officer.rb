# frozen_string_literal: true

class Officer < ApplicationRecord
     validates :person_id, :position, :year_elected, :description, presence: true
     belongs_to :person
     has_many :contact_forms
     has_one_attached :portrait
end
