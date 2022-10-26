# frozen_string_literal: true

class Alumni < ApplicationRecord
     validates :graduation_year, :person_id, presence: true
     belongs_to :person
end
