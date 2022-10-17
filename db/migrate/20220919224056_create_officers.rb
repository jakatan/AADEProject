class CreateOfficers < ActiveRecord::Migration[6.1]
  def change
    create_table :officers do |t|
      t.string :position
      t.string :email
      t.string :year_elected
      t.string :description
      t.string :photo
      t.integer :person_id

      t.timestamps
    end
  end
end
