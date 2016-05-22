Gem::Specification.new do |s|
  s.name        = 'sendgrid_mailer'
  s.version     = '0.1.0'
  s.date        = '2016-05-22'
  s.summary     = "Sendgrid Mailer gem for rails that allows to use sendgrid templates"
  s.description = "Sendgrid Mailer gem for rails that allows to use sendgrid templates"
  s.authors     = ["Denis Stepanov"]
  s.email       = 'denstepa@gmail.com'
  s.files       = ["lib/sendgrid_mailer.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license     = 'MIT'

  s.add_dependency 'mail', '~> 2.5'
  s.add_dependency 'sendgrid-ruby', '~> 1.1.6'

  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~>3.2.0'

end
