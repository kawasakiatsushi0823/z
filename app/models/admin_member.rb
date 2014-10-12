class AdminMember < ActiveRecord::Base
  include EmailHolder
  include PasswordHolder

  #PasswordHolderの作成
  #def password=(raw_password)
  #  if raw_password.kind_of?(String)
  #    self.hashed_password = BCrypt::Password.create(raw_password)
  #  elsif raw_password.nil?
  #    self.hashed_password = nil
  #  end
  #end

  def active?
    !suspended? && start_data <= Date.today &&
      (end_data.nil? || end_data > Date.today)
  end

end
