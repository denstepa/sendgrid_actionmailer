module SendgridActionMailer
  class Railtie < Rails::Railtie
    initializer 'sendgrid_actionmailer.add_delivery_method', before: 'action_actionmailer.set_configs' do
      ActionMailer::Base.add_delivery_method(:sendgrid_actionmailer, SendgridActionMailer::DeliveryMethod)
    end
  end
end
