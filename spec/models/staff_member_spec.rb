require 'rails_helper'

describe StaffMember do
  describe '#password=' do
    example '$BJ8;zNs$rM?$($k$H!"(Bhashed_password$B$OD9$5(B60$BJ8;zNs$K$J$k(B' do
      member = StaffMember.new
      member.password = 'password'
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example 'nil$B$rM?$($k$H!"(Bhashed_password$B$O(Bnil$B$K$J$k(B' do
      member = StaffMember.new(hashed_password: 'x')
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
