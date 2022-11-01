class MergeAdminsUnderPeople < ActiveRecord::Migration[6.1]
  def up
    add_column :people, :email, :string, null: false, default: ""
    add_column :people, :is_admin, :boolean
    remove_column :officers, :email, :string

    drop_table :admins
  end

  def down
    remove_column :people, :email, :string, null: false, default: ""
    remove_column :people, :is_admin, :boolean, default: false
    add_column :officers, :email, :string

    create_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :full_name
      t.string :uid
      t.string :avatar_url

      t.timestamps null: false
    end
  end
end
