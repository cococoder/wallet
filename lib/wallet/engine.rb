module Wallet
  class Engine < ::Rails::Engine
    isolate_namespace Wallet
    config.generators.api_only = true
  end
end
