module Wallet
  class Credit < ApplicationRecord
    belongs_to :account, class_name: "Wallet::Account", foreign_key: "wallet_account_id"
  end
end
