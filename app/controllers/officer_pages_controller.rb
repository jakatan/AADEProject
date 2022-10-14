class OfficerPagesController < ApplicationController
  before_action :set_officer, only: %i[ show ]

  # GET /officer_pages or /officer_pages.json
  def index
    @officers = Officer.all
    @contact_form = ContactForm.new
  end


  private
  # Use callbacks to share common setup or constraints between actions.
    def set_officer
      @officer = Officer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def officer_params
      params.require(:officer).permit(:position, :email, :year_elected, :description, :photo, :person_id, :portrait)
    end

end
