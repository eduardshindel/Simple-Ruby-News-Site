class ApplicationController < ActionController::Base
  include SessionsHelper
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
end
