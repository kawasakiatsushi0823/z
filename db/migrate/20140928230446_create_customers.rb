class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.string :gender
      t.date :birthday
      t.string :hashed_password

      t.timestamps
    end

    add_index :customers, :email_for_index, unique: true
    add_index :customers, [ :family_name_kana, :given_name_kana ]
  end
end
