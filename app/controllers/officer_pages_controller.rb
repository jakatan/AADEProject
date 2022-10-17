class OfficerPagesController < ApplicationController
  before_action :set_officer_page, only: %i[ show edit update destroy ]

  # GET /officer_pages or /officer_pages.json
  def index
    # @officer_pages = OfficerPage.all
  end

  # GET /officer_pages/1 or /officer_pages/1.json
  def show
  end

  # GET /officer_pages/new
  def new
    # @officer_page = OfficerPage.new
  end

  # GET /officer_pages/1/edit
  def edit
  end

  # POST /officer_pages or /officer_pages.json
  def create
    # @officer_page = OfficerPage.new(officer_page_params)
    #
    # respond_to do |format|
    #   if @officer_page.save
    #     format.html { redirect_to officer_page_url(@officer_page), notice: "Officer page was successfully created." }
    #     format.json { render :show, status: :created, location: @officer_page }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @officer_page.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /officer_pages/1 or /officer_pages/1.json
  def update
    # respond_to do |format|
    #   if @officer_page.update(officer_page_params)
    #     format.html { redirect_to officer_page_url(@officer_page), notice: "Officer page was successfully updated." }
    #     format.json { render :show, status: :ok, location: @officer_page }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @officer_page.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /officer_pages/1 or /officer_pages/1.json
  def destroy
    # @officer_page.destroy
    #
    # respond_to do |format|
    #   format.html { redirect_to officer_pages_url, notice: "Officer page was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_officer_page
    #   @officer_page = OfficerPage.find(params[:id])
    # end
    #
    # # Only allow a list of trusted parameters through.
    # def officer_page_params
    #   params.fetch(:officer_page, {})
    # end
end
