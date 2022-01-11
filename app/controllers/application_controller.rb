class ApplicationController < ActionController::Base
  include SessionsHelper

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
