# frozen_string_literal: true

json.extract!(officer, :id, :position, :year_elected, :description, :photo, :person_id, :created_at, :updated_at)
json.url(officer_url(officer, format: :json))
