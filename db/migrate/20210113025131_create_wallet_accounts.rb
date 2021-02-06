class CreateWalletAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_accounts do |t|
      t.string :tag

      t.timestamps
    end
  end
end
