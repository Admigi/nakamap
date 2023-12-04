class PinsController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :authenticate_user

  def index
    @pins = Pin.all
    @categories = Categorie.all

    @selected_category = params[:categorie_id] ? Categorie.find(params[:categorie_id]) : nil

    # Récupère les épingles en fonction de la catégorie sélectionnée ou récupère aucune épingle
    @pins = @selected_category ? @selected_category.pins : []

    @markers = @pins.present? ? @pins.geocoded.map do |pin|
      {
        lat: pin.latitude,
        lng: pin.longitude,
        marker_html: render_to_string(partial: "pin"),
        info_window_html: render_to_string(partial: "info_window", locals: { pin: pin })
      }
    end : []

  end

  def show
    @pin = Pin.find(params[:id])
    @categories = Categorie.all
    redirect_to root_path unless @post.pin == params[:pin_id]
  end


  private

  def pin_params
    params.require(:pin).permit!
  end

end
