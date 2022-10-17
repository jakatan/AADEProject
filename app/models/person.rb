# frozen_string_literal: true

class Person < ApplicationRecord
     validates :name, :class_year, :membership_length, presence: true
     has_many :positions, dependent: :destroy # This will delete all the positions to the person when person is deleted
     has_many :companies, through: :positions
     has_many :contact_forms, through: :officers
     has_one :officer, dependent: :destroy # Will delete officer when person is deleted
     has_one :alumni, dependent: :destroy # Will delete alumni when person is deleted
end
