class CreateOfficerPages < ActiveRecord::Migration[6.1]
  def change
    create_table :officer_pages do |t|

      t.timestamps
    end
  end
end
