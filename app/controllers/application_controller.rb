require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js

  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  def home
    if institution = Institution.first
      redirect_to institution_people_path(institution)
    else
      render text: "You need to set a institution to get started"
    end
  end
  
  private 
    
    def set_institution
      @institution = Institution.find(params[:institution_id])
    end
end