class CreateContactForms < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_forms do |t|
      t.integer :person_id
      t.string :email
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
