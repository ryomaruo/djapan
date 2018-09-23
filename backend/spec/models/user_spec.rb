require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#password=' do
    exapmle 'when given password, hased_password will be created which length is 60' do
      user = User.new
      user.password = 'testexpamle'
      expect(user.hashed_pw).to be_kind_of(String)
      expect(user.hashed_pw.size).to eq(60)
    end

    exapmle 'if given password is nil, hased_password will be nil' do
      user = User.new(hashed_password: 'testexpamle')
      user.password = nil
      expect(user.hashed_pw).to be_nil
    end
  end
end
