class CreateAlumnis < ActiveRecord::Migration[6.1]
  def change
    create_table :alumnis do |t|
      t.string :graduation_year
      t.string :companies_worked
      t.integer :companyID

      t.timestamps
    end
  end
end
