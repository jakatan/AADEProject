class Person < ApplicationRecord
  validates :name, :class_year, :membership_length, presence: true
  has_many :positions
  has_many :companies, through: :positions
end
