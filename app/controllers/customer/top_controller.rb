class Customer::TopController < ApplicationController
  def index
    raise Forbidden
  end
end
