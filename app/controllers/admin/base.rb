class Admin::Base < ApplicationController
  before_action :authorize

  private
  def authorize
    unless current_admin_member
      flash.alert = '$B4IM}<T$H$7$F%m%0%$%s$7$F$/$@$5$$!#(B'
      redirect_to :admin_login
    end
  end

  def current_admin_member
    if session[:admin_member_id]
      @current_admin_member ||=
        AdminMember.find_by(id: session[:admin_member_id])
    end
  end

  helper_method :current_admin_member
end
