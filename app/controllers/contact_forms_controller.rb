# frozen_string_literal: true

class ContactFormsController < ApplicationController
     before_action :authenticate_person!, except: %i[create show update edit]
     before_action :set_contact_form, only: %i[show edit update destroy]

     # GET /contact_forms or /contact_forms.json
     def index
          @contact_forms = ContactForm.all
     end

     # GET /contact_forms/1 or /contact_forms/1.json
     def show; end

     # GET /contact_forms/new
     def new
          @contact_form = ContactForm.new
     end

     # GET /contact_forms/1/edit
     def edit; end

     # POST /contact_forms or /contact_forms.json
     def create
          @contact_form = ContactForm.new(contact_form_params)
          @officer_pages = Officer
          respond_to do |format|
               if @contact_form.save
                    flash[:success] = "Contact form was successfully submitted."
                    format.html { redirect_to request.referer }
               else
                    flash[:error] = "Contact form failed to submit. Make sure you filled out all of the input boxes."
                    format.html { redirect_to request.referer }
               end
          end
     end

     # PATCH/PUT /contact_forms/1 or /contact_forms/1.json
     def update
          respond_to do |format|
               if @contact_form.update(contact_form_params)
                    format.html { redirect_to(contact_form_url(@contact_form), notice: 'Contact form was successfully updated.') }
                    format.json { render(:show, status: :ok, location: @contact_form) }
               else
                    format.html { render(:edit, status: :unprocessable_entity) }
                    format.json { render(json: @contact_form.errors, status: :unprocessable_entity) }
               end
          end
     end

     # DELETE /contact_forms/1 or /contact_forms/1.json
     def destroy
          @contact_form.destroy!

          respond_to do |format|
               format.html { redirect_to(contact_forms_url, notice: 'Contact form was successfully destroyed.') }
               format.json { head(:no_content) }
          end
     end

     private

     # Use callbacks to share common setup or constraints between actions.
     def set_contact_form
          @contact_form = ContactForm.find(params[:id])
     end

     # Only allow a list of trusted parameters through.
     def contact_form_params
          params.require(:contact_form).permit(:person_id, :email, :name, :message)
     end
end
