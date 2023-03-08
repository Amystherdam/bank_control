class AccountTransactionsController < ApplicationController
  before_action :set_account_transaction, only: %i[ show ]
  before_action :set_kinds, only: %i[ new create ]
  before_action :set_bank_account, only: %i[ new create ]
  before_action :inject_dependencies, only: %i[create update]

  # GET /account_transactions
  def index
    @account_transactions = AccountTransaction.all
  end

  # GET /account_transactions/1
  def show
  end

  # GET /account_transactions/new
  def new
    @account_transaction = AccountTransaction.new
  end

  # POST /account_transactions
  def create
    @account_transaction = AccountTransaction.new(account_transaction_params)
    @account_transaction.bank_account = @bank_account

    if @transaction_service.allow_transaction(@account_transaction)
      if @account_transaction.save
        @transaction_service.update_account_balance(@account_transaction)

        redirect_to @account_transaction, notice: "Account transaction was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_account_transaction_path, notice: "High value transaction, check your limit per transaction"
    end
  end

  private

    def set_kinds
      @kinds = AccountTransaction.kinds.keys
    end

    def set_bank_account
      if params[:account_transaction] && params[:account_transaction][:source_account]
        @bank_account = BankAccount.find_by(account_number: params[:account_transaction][:source_account]) 
      end
    end

    def inject_dependencies
      @transaction_service = TransactionService.new
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_account_transaction
      @account_transaction = AccountTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_transaction_params
      params.require(:account_transaction).permit(:transaction_value, :kind, :destination_bank_account, :source_account, :user_id)
    end
end
