require 'rails_helper'

describe StaffMember do
  describe '#password=' do
    example '文字列を与えると、hashed_passwordは長さ60文字列になる' do
      member = StaffMember.new
      member.password = 'password'
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example 'nilを与えると、hashed_passwordはnilになる' do
      member = StaffMember.new(hashed_password: 'x')
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
