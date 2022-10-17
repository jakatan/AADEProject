class RemovePhotoFromOfficers < ActiveRecord::Migration[6.1]
  def up
    remove_column :officers, :photo, :string
  end

  def down
    add_column :officers, :photo, :string
  end
end
