class Admin::SessionsController < Admin::Base
  skip_before_action :authorize
  def new
    if current_admin_member
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      admin_member = AdminMember.find_by(email_for_index: @form.email.downcase)
    end
    if Admin::Authenticator.new(admin_member).authenticate(@form.password)
      session[:admin_member_id] = admin_member.id
      session[:last_access_time] = Time.current
      flash.notice = 'ログインしました。'
      redirect_to :admin_root
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:admin_member_id)
    redirect_to :admin_root
  end

end
