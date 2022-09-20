class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.string :position
      t.integer :companyID

      t.timestamps
    end
  end
end
