class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?

  private
  def set_layout
    if request.path.match(%r{(staff|admin|customer)\b})
      Regexp.last_match[1]
    else
      'staff'
    end
  end

end
