# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_gateway_checkout_v2"
  s.version     = "1.0.1"
  s.summary     = "Checkout V2 Payment Gateway for Solidus"
  s.description = s.summary
  s.required_ruby_version = ">= 2.1"

  s.author       = "James Whelton"
  s.email        = "james@whelton.io"
  s.homepage     = "https://github.com/whelton/solidus_gateway_checkout_v2"
  s.license      = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  s.add_dependency "solidus_core", "~> 1.1"

  s.add_development_dependency "rspec-rails", "~> 3.2"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency "factory_girl", "~> 4.4"
  s.add_development_dependency "capybara"
  s.add_development_dependency "poltergeist", "~> 1.5.0"
  s.add_development_dependency "database_cleaner", "1.2.0"
end
