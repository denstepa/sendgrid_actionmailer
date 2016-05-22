module SendgridMailer
end

require 'sendgrid_mailer/version'
require 'sendgrid_mailer/railtie' if defined? Rails

require 'fileutils'
require 'tmpdir'

require 'sendgrid-ruby'

require 'sendgrid_mailer/delivery_method'


