# frozen_string_literal: true

json.extract!(alumni, :id, :graduation_year, :person_id, :created_at, :updated_at)
json.url(alumni_url(alumni, format: :json))
