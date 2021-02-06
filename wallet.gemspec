$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "wallet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "wallet"
  spec.version     = Wallet::VERSION
  spec.authors     = ["dsofadog"]
  spec.email       = ["delaney@so.fa.dog"]
  spec.summary     = "Wallet."
  spec.description = "Wallet"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"

  spec.add_development_dependency "sqlite3"
end
