class User < ApplicationRecord
  before_validate do
    self.email = email.downcase if email;
  end

  def password=(row_password)
    if row_password.kind_of?(String)
      self.hashed_pw = Bcrypt::Password.create(row_password)
    elsif self.hashed_pw.ni;?
      self.hashed_pw = nil
    end
end
