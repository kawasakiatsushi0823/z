class Admin::Base < ApplicationController

  private
  def current_admin_member
    if session[:admin_member_id]
      @current_admin_member ||=
        AdminMember.find_by(id: session[:admin_member_id])
    end
  end

  helper_method :current_admin_member
end
