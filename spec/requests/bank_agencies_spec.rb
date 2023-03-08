require 'rails_helper'

RSpec.describe "/bank_agencies", type: :request do

  let(:valid_attributes) do
    {
      agency_number: "0000",
      address: "Agency Address"
    }
  end

  let(:invalid_attributes) do
    {
      agency_number: nil,
      address: nil
    }
  end

  before do
    user = create(:user)
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      BankAgency.create! valid_attributes
      get bank_agencies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      bank_agency = BankAgency.create! valid_attributes
      get bank_agency_url(bank_agency)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_bank_agency_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      bank_agency = BankAgency.create! valid_attributes
      get edit_bank_agency_url(bank_agency)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new BankAgency" do
        expect {
          post bank_agencies_url, params: { bank_agency: valid_attributes }
        }.to change(BankAgency, :count).by(1)
      end

      it "redirects to the created bank_agency" do
        post bank_agencies_url, params: { bank_agency: valid_attributes }
        expect(response).to redirect_to(bank_agency_url(BankAgency.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new BankAgency" do
        expect {
          post bank_agencies_url, params: { bank_agency: invalid_attributes }
        }.to change(BankAgency, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post bank_agencies_url, params: { bank_agency: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          agency_number: "1111",
          address: "New Agency Address"
        }
      end

      it "updates the requested bank_agency" do
        bank_agency = BankAgency.create! valid_attributes
        patch bank_agency_url(bank_agency), params: { bank_agency: new_attributes }
        bank_agency.reload
        expect(bank_agency.agency_number).to eq(new_attributes[:agency_number])
      end

      it "redirects to the bank_agency" do
        bank_agency = BankAgency.create! valid_attributes
        patch bank_agency_url(bank_agency), params: { bank_agency: new_attributes }
        bank_agency.reload
        expect(response).to redirect_to(bank_agency_url(bank_agency))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        bank_agency = BankAgency.create! valid_attributes
        patch bank_agency_url(bank_agency), params: { bank_agency: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested bank_agency" do
      bank_agency = BankAgency.create! valid_attributes
      expect {
        delete bank_agency_url(bank_agency)
      }.to change(BankAgency, :count).by(-1)
    end

    it "redirects to the bank_agencies list" do
      bank_agency = BankAgency.create! valid_attributes
      delete bank_agency_url(bank_agency)
      expect(response).to redirect_to(bank_agencies_url)
    end
  end
end
