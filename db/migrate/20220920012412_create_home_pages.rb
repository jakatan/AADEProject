class CreateHomePages < ActiveRecord::Migration[6.1]
  def change
    create_table :home_pages do |t|

      t.timestamps
    end
  end
end
