class Admin::BaseController < ApplicationController
  layout 'admin/application'

  before_action :ensure_authenticated!

  private
  def ensure_authenticated!
    redirect_to admin_login_path unless admin_signed_in?
  end

  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find(session[:admin_id]) rescue nil
    end
  end

  def admin_signed_in?
    !current_admin.nil?
  end

  helper_method :current_admin, :admin_signed_in?
end
