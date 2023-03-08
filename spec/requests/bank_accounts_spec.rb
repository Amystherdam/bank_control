require 'rails_helper'

RSpec.describe "/bank_accounts", type: :request do
  
  let(:bank_agency) { create(:bank_agency) }
  let(:bank_account) { create(:bank_account, bank_agency:) }
  
  let(:valid_attributes) do
    {
      account_number: "0001",
      transaction_limit: 1,
      agency_number: bank_agency.agency_number
    }
  end
  
  let(:invalid_attributes) do
    {
      account_number: nil,
      transaction_limit: nil,
      agency_number: nil
    }
  end
  
  before do
    user = create(:user)
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      bank_account
      get bank_accounts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      bank_account
      get bank_account_url(bank_account)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_bank_account_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      bank_account
      get edit_bank_account_url(bank_account)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new BankAccount" do
        expect {
          post bank_accounts_url, params: { bank_account: valid_attributes }
        }.to change(BankAccount, :count).by(1)
      end

      it "redirects to the created bank_account" do
        post bank_accounts_url, params: { bank_account: valid_attributes }
        expect(response).to redirect_to(bank_account_url(BankAccount.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new BankAccount" do
        expect {
          post bank_accounts_url, params: { bank_account: invalid_attributes }
        }.to change(BankAccount, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post bank_accounts_url, params: { bank_account: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          account_number: "0000",
          transaction_limit: 1,
          agency_number: bank_agency.agency_number
        }
      end

      it "updates the requested bank_account" do
        bank_account
        patch bank_account_url(bank_account), params: { bank_account: new_attributes }
        bank_account.reload
        expect(bank_account.account_number).to eq(new_attributes[:account_number])
      end

      it "redirects to the bank_account" do
        bank_account
        patch bank_account_url(bank_account), params: { bank_account: new_attributes }
        bank_account.reload
        expect(response).to redirect_to(bank_account_url(bank_account))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        bank_account
        patch bank_account_url(bank_account), params: { bank_account: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested bank_account" do
      bank_account
      expect {
        delete bank_account_url(bank_account)
      }.to change(BankAccount, :count).by(-1)
    end

    it "redirects to the bank_accounts list" do
      bank_account
      delete bank_account_url(bank_account)
      expect(response).to redirect_to(bank_accounts_url)
    end
  end
end
