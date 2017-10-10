class ApplicationController < ActionController::Base
  include Pundit

  layout 'application'

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  KDYM_SITE = 'http://www.kdymsolucoes.com.br/'
end
