class Admin::TopController < Admin::Base
  def index
    if current_admin_member
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end
end
