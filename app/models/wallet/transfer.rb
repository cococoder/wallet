module Wallet
  class Transfer < Transaction
    after_create_commit :set_credits
    validate :sufficient_balance, on: :create
    def sufficient_balance
      if account.balance == 0 || account.balance < self.amount
        errors.add(:debits, "tag: #{account.tag} balance: #{account.balance}, amount: #{self.amount}, insufficient balance!")
      end
    end
    def set_credits
      transaction do
        Debit.create account: self.account, amount: self.amount
        Credit.create account: Account.find_by_tag(self.to), amount: self.amount
      end
    end
  end
end