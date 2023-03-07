class BankAgenciesController < ApplicationController
  before_action :set_bank_agency, only: %i[ show edit update destroy ]

  # GET /bank_agencies
  def index
    @bank_agencies = BankAgency.all
  end

  # GET /bank_agencies/1
  def show
  end

  # GET /bank_agencies/new
  def new
    @bank_agency = BankAgency.new
  end

  # GET /bank_agencies/1/edit
  def edit
  end

  # POST /bank_agencies
  def create
    @bank_agency = BankAgency.new(bank_agency_params)

    if @bank_agency.save
      redirect_to @bank_agency, notice: "Bank agency was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_agencies/1
  def update
    if @bank_agency.update(bank_agency_params)
      redirect_to @bank_agency, notice: "Bank agency was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bank_agencies/1
  def destroy
    @bank_agency.destroy
    redirect_to bank_agencies_url, notice: "Bank agency was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_agency
      @bank_agency = BankAgency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_agency_params
      params.require(:bank_agency).permit(:agency_number, :address)
    end
end
