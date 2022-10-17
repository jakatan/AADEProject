class FixCompanyColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :companies, :companyName, :name
    rename_column :companies, :company_website, :website
  end
end
