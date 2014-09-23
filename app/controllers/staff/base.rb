class Staff::Base < ApplicationController

  before_action :authorize
  before_action :check_account
  before_action :check_timeout


  private
  def authorize
    unless current_staff_member
      flash.alert = '$B%m%0%$%s$7$F$/$@$5$$!#(B'
      redirect_to :login
    end
  end

  def current_staff_member
    if session[:staff_member_id]
      @current_staff_member ||=
        StaffMember.find_by(id: session[:staff_member_id])
    end
  end

  def check_account
    if current_staff_member && !current_staff_member.active?
      session.delete(:staff_member_id)
      flash.alert = '$B%"%+%&%H$,L58z$K$J$j$^$7$?!#(B'
      redirect_to :staff_root
    end
  end

  TIMEOUT = 60.minutes

  def check_timeout
    if current_staff_member
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:staff_member_id)
        flash.alert = '$B%;%C%7%g%s$,%?%$%`%"%&%H$7$^$7$?!#(B'
        redirect_to :staff_login
      end
    end
  end

  helper_method :current_staff_member
end
