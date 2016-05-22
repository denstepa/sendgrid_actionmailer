# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendgrid_mailer/version'

Gem::Specification.new do |s|
  s.name        = 'sendgrid_mailer'
  s.version     = SendgridMailer::VERSION
  s.date        = '2016-05-22'
  s.summary     = "Sendgrid Mailer gem for rails that allows to use sendgrid templates"
  s.description = "Sendgrid Mailer gem for rails that allows to use sendgrid templates"
  s.authors     = ["Denis Stepanov"]
  s.email       = 'denstepa@gmail.com'
  # s.files       = ["lib/sendgrid_mailer.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license     = 'MIT'


  s.files         = `git ls-files -z`.split("\x0")
  # s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'mail', '~> 2.5'
  s.add_dependency 'sendgrid-ruby', '~> 1.1.6'

  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~>3.2.0'

end
