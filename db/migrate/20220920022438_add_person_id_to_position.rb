class AddPersonIdToPosition < ActiveRecord::Migration[6.1]
  def change
    add_column :positions, :person_id, :integer
  end
end
