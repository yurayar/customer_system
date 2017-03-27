class Admin::AdminController < ApplicationController
  before_action :verify_admin

  def index

  end

  private

  def verify_admin
    redirect_to root_path unless current_user.admin
  end
end