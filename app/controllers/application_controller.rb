class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  # Override build_footer method in ActiveAdmin::Views::Pages
    require 'active_admin_views_pages_base.rb'


end
