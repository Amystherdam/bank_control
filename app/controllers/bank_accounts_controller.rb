class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[ show edit update destroy ]
  before_action :set_bank_agency, only: %i[ edit new create update ]
  before_action :set_agency_numbers, only: %i[ edit new create update ]

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
    @selected_agency_number = @bank_account.bank_agency.agency_number
  end

  # POST /bank_accounts
  def create
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.bank_agency = @bank_agency
    # binding.b
    if @bank_account.save
      redirect_to @bank_account, notice: "Bank account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_accounts/1
  def update
    @bank_account.bank_agency = @bank_agency

    if @bank_account.update(bank_account_params)
      redirect_to @bank_account, notice: "Bank account was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bank_accounts/1
  def destroy
    if @bank_account.account_transactions.any?
      redirect_to bank_accounts_url, notice: "Cannot delete bank account with transactions."
    else
      @bank_account.destroy
      redirect_to bank_accounts_url, notice: "Bank account was successfully destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    def set_bank_agency
      @bank_agency = BankAgency.find_by(agency_number: params[:bank_account][:agency_number]) if params[:bank_account] && params[:bank_account][:agency_number]
    end

    def set_agency_numbers
      @agency_numbers = BankAgency.pluck(:agency_number)
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.require(:bank_account).permit(:account_number, :transaction_limit, :agency_number)
    end
end
