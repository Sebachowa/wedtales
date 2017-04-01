class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# ------------ Call-Back ------------
  before_action :authenticate_user!
end
