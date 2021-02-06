module Wallet
  class Account < ApplicationRecord
    validates_presence_of :tag
    validates_uniqueness_of :tag
    has_many :transactions, :class_name => 'Wallet::Transaction',foreign_key: "wallet_account_id"
    has_many :debits, class_name: "Wallet::Debit", foreign_key: "wallet_account_id"
    has_many :credits, class_name: "Wallet::Credit", foreign_key: "wallet_account_id"
    def balance
      credits.map(&:amount).sum - debits.map(&:amount).sum
    end
    def as_json(options = nil) 
      super(include: [:debits,:credits],methods: :balance)
    end

    def to_param
      self.tag
    end
  end
end
