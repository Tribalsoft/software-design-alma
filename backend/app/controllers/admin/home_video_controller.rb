class Admin::HomeVideoController < ApplicationController
  layout "admin"

  # Mostrar formulario de edición o creación
  def edit
    @home_video = HomeVideo.first_or_initialize
  end

  # Guardar cambios (actualizar o crear)
  def update
    @home_video = HomeVideo.first_or_initialize
    if @home_video.update(home_video_params)
      redirect_to admin_dashboard_path, notice: "Video actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete_all
    HomeVideo.destroy_all
    redirect_to admin_dashboard_path, notice: "el video fue eliminado."
  end

  private

  def home_video_params
    params.require(:home_video).permit(:title, :slogan, :text_color, :file_video)
  end
end
