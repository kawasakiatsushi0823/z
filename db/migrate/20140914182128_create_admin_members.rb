class CreateAdminMembers < ActiveRecord::Migration
  def change
    create_table :admin_members do |t|
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.string :hashed_password
      t.date :start_data, null: false
      t.date :end_data
      t.boolean :suspended, null: false, default: false

      t.timestamps
    end

    add_index :admin_members, :email_for_index, unique: true
    add_index :admin_members, [ :family_name_kana, :given_name_kana]

  end
end
