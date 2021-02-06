Wallet::Engine.routes.draw do
  resources :accounts do
    resources :transactions
    resources :top_ups,controller: "transactions"
    resources :spends,controller: "transactions"
    resources :transfers,controller: "transactions"
  end
end
