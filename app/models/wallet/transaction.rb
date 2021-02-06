module Wallet
  class Transaction < ApplicationRecord
    belongs_to :account, class_name: "Wallet::Account", foreign_key: "wallet_account_id"
    def self.type_from(params)
      return TopUp if params.has_key? :topup
      return Spend if params.has_key? :spend
      return Transfer if params.has_key? :transfer
    end
  end
end