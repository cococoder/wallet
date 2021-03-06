class CreateWalletCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_credits do |t|
      t.references :wallet_account, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
