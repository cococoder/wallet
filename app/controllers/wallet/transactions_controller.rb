require_dependency "wallet/application_controller"

module Wallet
  class TransactionsController < ApplicationController
    before_action :set_account
    before_action :set_transaction, only: [:show, :update, :destroy]

    # GET /transactions
    def index
      @transactions = @account.transactions.all
      render json: @transactions
    end

    # GET /transactions/1
    def show
      render json: [@account,@transaction]
    end

    # POST /transactions
    def create
      @transaction = Transaction.type_from(params).new(transaction_params)
      @transaction.account = @account

      if @transaction.save
        render json: [@account,@transaction], status: :created, location: [@account,@transaction]
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /transactions/1
    def update
      if @transaction.update(transaction_params)
        render json: [@account,@transaction]
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end

    # DELETE /transactions/1
    def destroy
      @transaction.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transaction
        @transaction = Transaction.find(params[:id])
      end

      def set_account
        @account = Account.find_by_tag(params[:account_id])
      end


    # Only allow a trusted parameter "white list" through.
      def transaction_params
        return params.require(:topup).permit(:account_id, :amount) if params.has_key? :topup
        return params.require(:spend).permit(:account_id, :amount) if params.has_key? :spend
        return params.require(:transfer).permit(:account_id, :amount,:to) if params.has_key? :transfer
      end
  end
end
