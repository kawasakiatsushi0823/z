class StaffEvent < ActiveRecord::Base
  self.inheritance_colum = nil

  belongs_to :member, class_name: 'StaffMember', foreign_key: 'staff_member_id'
  alias_attributes :occurred_at, :created_at

end
