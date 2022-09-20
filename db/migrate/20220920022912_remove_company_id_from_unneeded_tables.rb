class RemoveCompanyIdFromUnneededTables < ActiveRecord::Migration[6.1]
  def change
    remove_column :officers, :companyID
    remove_column :companies, :companyID
    remove_column :alumnis, :companyID
    remove_column :people, :companyID
    remove_column :officers, :officer_id
    add_column :alumnis, :person_id, :string
  end
end
