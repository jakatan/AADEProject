# frozen_string_literal: true

class DeviseCreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :full_name
      t.string :uid
      t.string :avatar_url

      t.timestamps null: false
    end

  end
end
