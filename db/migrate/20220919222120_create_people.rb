class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :class_year
      t.string :membership_length

      t.timestamps
    end
  end
end
