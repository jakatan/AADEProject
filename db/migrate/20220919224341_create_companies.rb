class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :companyName
      t.string :company_website

      t.timestamps
    end
  end
end
