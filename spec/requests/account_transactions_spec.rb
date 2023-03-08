require 'rails_helper'

RSpec.describe "/account_transactions", type: :request do
  
  let(:bank_account) { create(:bank_account) }
  let(:user) { create(:user) }

  let(:valid_attributes) do
    {
      transaction_value: "1000",
      kind: :deposit,
      bank_account_id: bank_account.id,
      user_id: user.id
    }
  end

  let(:invalid_attributes) do
    {
      transaction_value: nil,
      kind: nil,
      bank_account: nil,
      user: nil
    }
  end

  before do
    user = create(:user)
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      AccountTransaction.create! valid_attributes
      get account_transactions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      account_transaction = AccountTransaction.create! valid_attributes
      get account_transaction_url(account_transaction)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_account_transaction_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      account_transaction = AccountTransaction.create! valid_attributes
      get edit_account_transaction_url(account_transaction)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new AccountTransaction" do
        expect {
          post account_transactions_url, params: { account_transaction: valid_attributes }
        }.to change(AccountTransaction, :count).by(1)
      end

      it "redirects to the created account_transaction" do
        post account_transactions_url, params: { account_transaction: valid_attributes }
        expect(response).to redirect_to(account_transaction_url(AccountTransaction.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new AccountTransaction" do
        expect {
          post account_transactions_url, params: { account_transaction: invalid_attributes }
        }.to change(AccountTransaction, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post account_transactions_url, params: { account_transaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { transaction_value: 25_000 }
      end

      it "updates the requested account_transaction" do
        account_transaction = AccountTransaction.create! valid_attributes
        patch account_transaction_url(account_transaction), params: { account_transaction: new_attributes }
        account_transaction.reload
        expect(account_transaction.transaction_value).to eq(new_attributes[:transaction_value])
      end

      it "redirects to the account_transaction" do
        account_transaction = AccountTransaction.create! valid_attributes
        patch account_transaction_url(account_transaction), params: { account_transaction: new_attributes }
        account_transaction.reload
        expect(response).to redirect_to(account_transaction_url(account_transaction))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        account_transaction = AccountTransaction.create! valid_attributes
        patch account_transaction_url(account_transaction), params: { account_transaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end
end
