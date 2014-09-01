class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout

  rescue_from ActionController::RoutingError, with: :rescue404

  def rescue404(e)
    @exception = e
    render 'errors/not_found', status: 404
  end

  private
  def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      'customer'
    end
  end
end
