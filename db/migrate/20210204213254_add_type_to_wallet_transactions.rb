class AddTypeToWalletTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :wallet_transactions, :type, :string
  end
end
