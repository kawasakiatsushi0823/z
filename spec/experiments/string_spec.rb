require 'spec_helper'

descrilbe String do
  describe '#<<' do
    example '$BJ8;z$NDI2C(B' do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end
  end
end
