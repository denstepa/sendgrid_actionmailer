module SendgridMailer
  class Railtie < Rails::Railtie
    initializer 'sendgrid_mailer.add_delivery_method', before: 'action_mailer.set_configs' do
      ActionMailer::Base.add_delivery_method(:sendgrid_mailer, SendgridMailer::DeliveryMethod)
    end
  end
end
