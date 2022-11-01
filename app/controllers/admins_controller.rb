# frozen_string_literal: true

class AdminsController < ApplicationController
     before_action :authenticate_person!
     # GET /admins or /admins.json
     def index
     end
end
