class Admin::TopController < ApplicationController
  def index
    raise IpAddressRejected
  end
end
