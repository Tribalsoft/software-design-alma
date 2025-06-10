class Admin::DashboardController < ApplicationController
  layout "admin"
  before_action :authenticate_user!  # Asegura que el usuario esté autenticado
  before_action :check_admin_role    # Verifica si el usuario tiene el rol de administrador

  def index
    @users = User.all
    @category = Category.all

    @labels = (1..12).map { |m| Date::MONTHNAMES[m] }
    year = Date.current.year.to_s

    @usuarios_por_mes = (1..12).map do |month|
      month_str = month.to_s.rjust(2, '0') # '01', '02', ..., '12'
      User.where("strftime('%Y', created_at) = ? AND strftime('%m', created_at) = ?", year, month_str).count
    end
  end

  private

  def check_admin_role
    redirect_to root_path, alert: "No tienes permisos de administrador" unless current_user.admin?
  end
end
