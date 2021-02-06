class AddToToWalletTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :wallet_transactions, :to, :string
  end
end
