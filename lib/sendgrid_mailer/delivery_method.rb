module SendgridMailer
  class DeliveryMethod
    attr_accessor :client

    PARAMS = [
      :subject,
      :text,
      :html,
      :reply_to,
      :date,
      :smtpapi,
      :attachments
    ]

    def initialize(sendgrid_config)
      @client = SendGrid::Client.new(sendgrid_config)
    end

    def deliver!(mail)
      prepared_mail = prepare mail
      client.send(prepared_mail)
    end

    def settings
      {return_response: true}
    end

    def prepare(mail)
      to = Mail::Address.new(mail[:to].value)
      from = Mail::Address.new(mail[:from].value)

      substitutions = mail[:substitutions] ? JSON.parse(mail[:substitutions].value) : {}
      variables = mail[:variables] ? JSON.parse(mail[:variables].value) : {}

      SendGrid::Mail.new do |m|
        m.to = to.address
        m.to_name = to.name
        m.from = from.address
        m.from_name = from.name
        total_recepients = 1

        if mail[:cc]
          cc = Mail::Address.new(mail[:cc].value)
          m.cc = cc.address
          m.cc_name = cc.name
        end

        if mail[:bcc]
          bcc = mail[:bcc].value
          bcc = [bcc] if bcc.is_a?(String)
          m.bcc = bcc.map{ |address|  Mail::Address.new(address).address }
          m.bcc_name = bcc.map{ |address|  Mail::Address.new(address).name }
          total_recepients = total_recepients + bcc.count
        end

        m.subject = mail[:subject].value

        if mail[:template]
          m.template = SendGrid::Template.new(mail[:template].value)
          m.html = mail[:include_body] ? mail.body.raw_source : ' '
        else
          m.html = mail.body.raw_source
        end

        m.smtpapi.add_category mail[:category].value

        substitutions.each do |key, value|
          m.smtpapi.add_substitution("%#{key}%", [value] * total_recepients)
        end

        variables.each do |key, value|
          m.smtpapi.add_substitution("%#{key}%", [value] * total_recepients)
        end
      end
    end

  end
end
