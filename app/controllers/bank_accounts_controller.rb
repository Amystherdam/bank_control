class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[ show edit update destroy ]

  # GET /bank_accounts
  def index
    @bank_accounts = BankAccount.all
  end

  # GET /bank_accounts/1
  def show
  end

  # GET /bank_accounts/new
  def new
    @bank_account = BankAccount.new
  end

  # GET /bank_accounts/1/edit
  def edit
  end

  # POST /bank_accounts
  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      redirect_to @bank_account, notice: "Bank account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_accounts/1
  def update
    if @bank_account.update(bank_account_params)
      redirect_to @bank_account, notice: "Bank account was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bank_accounts/1
  def destroy
    @bank_account.destroy
    redirect_to bank_accounts_url, notice: "Bank account was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.require(:bank_account).permit(:account_number, :transaction_limit, :bank_agency_id)
    end
end
