module Wallet
  class TopUp < Transaction
    after_create_commit :set_credits
    def set_credits
      Credit.create account: self.account , amount: self.amount
    end
  end
end