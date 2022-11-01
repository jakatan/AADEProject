# frozen_string_literal: true

json.extract!(person, :id, :name, :class_year, :membership_length, :email, :is_admin, :created_at, :updated_at)
json.url(person_url(person, format: :json))
