# frozen_string_literal: true

class Person < ApplicationRecord
     devise :omniauthable, omniauth_providers: [:google_oauth2]

     validates :name, :class_year, :membership_length, :email, presence: true
     has_many :positions, dependent: :destroy # This will delete all the positions to the person when person is deleted
     has_many :companies, through: :positions
     has_many :contact_forms, through: :officers
     has_one :officer, dependent: :destroy # Will delete officer when person is deleted
     has_one :alumni, dependent: :destroy # Will delete alumni when person is deleted

     def self.from_omniauth(auth)
          Person.where(email: auth.info.email, is_admin: true).first
     end
end
