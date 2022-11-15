# frozen_string_literal: true

class AdminsController < ApplicationController
     before_action :authenticate_person!
     # GET /admins or /admins.json
     def index
     end
     def change_email
          if params[:address] == ""
               redirect_to admins_path
               flash[:error] = "Must provide an email"
          elsif params[:address].include? ".com"
               $calendar_email = params[:address]
               redirect_to admins_path
               flash[:success] =  "Email has been successfully changed"
          elsif params[:address].include? ".edu"
               $calendar_email = params[:address]
               redirect_to admins_path
               flash[:success] =  "Email has been successfully changed"
          else
               redirect_to admins_path
               flash[:error] = "Must provide a valid email with proper extension"
          end
     end
end
