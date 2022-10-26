class RemoveCompaniesWorkedFromAlumni < ActiveRecord::Migration[6.1]
  def up
    remove_column :alumnis, :companies_worked, :string
  end

  def down
    add_column :alumnis, :companies_worked, :string
  end
end
