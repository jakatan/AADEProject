require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/officer_pages", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # OfficerPage. As you add validations to OfficerPage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      OfficerPage.create! valid_attributes
      get officer_pages_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      officer_page = OfficerPage.create! valid_attributes
      get officer_page_url(officer_page)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_officer_page_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      officer_page = OfficerPage.create! valid_attributes
      get edit_officer_page_url(officer_page)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new OfficerPage" do
        expect {
          post officer_pages_url, params: { officer_page: valid_attributes }
        }.to change(OfficerPage, :count).by(1)
      end

      it "redirects to the created officer_page" do
        post officer_pages_url, params: { officer_page: valid_attributes }
        expect(response).to redirect_to(officer_page_url(OfficerPage.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new OfficerPage" do
        expect {
          post officer_pages_url, params: { officer_page: invalid_attributes }
        }.to change(OfficerPage, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post officer_pages_url, params: { officer_page: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested officer_page" do
        officer_page = OfficerPage.create! valid_attributes
        patch officer_page_url(officer_page), params: { officer_page: new_attributes }
        officer_page.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the officer_page" do
        officer_page = OfficerPage.create! valid_attributes
        patch officer_page_url(officer_page), params: { officer_page: new_attributes }
        officer_page.reload
        expect(response).to redirect_to(officer_page_url(officer_page))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        officer_page = OfficerPage.create! valid_attributes
        patch officer_page_url(officer_page), params: { officer_page: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested officer_page" do
      officer_page = OfficerPage.create! valid_attributes
      expect {
        delete officer_page_url(officer_page)
      }.to change(OfficerPage, :count).by(-1)
    end

    it "redirects to the officer_pages list" do
      officer_page = OfficerPage.create! valid_attributes
      delete officer_page_url(officer_page)
      expect(response).to redirect_to(officer_pages_url)
    end
  end
end
