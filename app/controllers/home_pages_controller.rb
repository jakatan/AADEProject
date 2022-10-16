# frozen_string_literal: true

class HomePagesController < ApplicationController
     # before_action :set_home_page, only: %i[ show edit update destroy ]

     # GET /home_pages or /home_pages.json
     def index
          # @home_pages = HomePage.all
          @alumnis = Alumni.all
          @companies = Company.all
     end

     # GET /home_pages/1 or /home_pages/1.json

     private

     # Use callbacks to share common setup or constraints between actions.

     # Only allow a list of trusted parameters through.
     def home_page_params
          params.fetch(:home_page, {})
     end
end
