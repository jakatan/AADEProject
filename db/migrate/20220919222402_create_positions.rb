class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :position
      t.integer :person_id
      t.integer :company_id

      t.timestamps
    end
  end
end
