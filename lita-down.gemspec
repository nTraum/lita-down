Gem::Specification.new do |spec|
  spec.name          = "lita-down"
  spec.version       = "1.0.0"
  spec.authors       = ["Philipp Preß"]
  spec.email         = ["philipp.press@googlemail.com"]
  spec.description   = "Lita plugin that reports if a website is down or not."
  spec.summary       = "Lita plugin that reports if a website is down or not."
  spec.homepage      = "https://github.com/nTraum/lita-down"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
