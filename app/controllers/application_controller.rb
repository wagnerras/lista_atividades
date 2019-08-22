class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_locale
    layout :layout_by_resource


    def set_locale
      if params[:locale]
         cookies[:locale] = params[:locale]
      end
      
      if cookies[:locale]
        if I18n.locale != cookies[:locale]
           I18n.locale = cookies[:locale]
        end
      end
    end

  protected

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end  
end
