class CreateStaffEvents < ActiveRecord::Migration
  def change
    create_table :staff_events do |t|
      t.references :staff_member, null: false      #$B?&0w%l%3!<%I$X$N30It%-!<(B
      t.string :type, null: false                  #$B%$%Y%s%H%?%$%W(B
      t.datetime :created_at, null: false          #$BH/@8;~9o(B
    end

    add_index :staff_events, :created_at
    add_index :staff_events, [ :staff_member_id, :created_at ]
    add_foreign_key :staff_events, :staff_members
  end
end


