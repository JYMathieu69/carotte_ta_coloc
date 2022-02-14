if !Rails.env.test? && ENV['EMAIL_NO_INTERCEPTOR'].nil? && ENV['EMAILS_FALLBACK'].nil?
  raise 'you need set a env variable EMAILS_FALLBACK or in production set EMAIL_NO_INTERCEPTOR to `true`'
end

class EmailInterceptor
  def self.delivering_email(message)
    authorized_emails = ENV.fetch('EMAILS_AUTHORIZED', '').split(',')
    email_fallback = ENV.fetch('EMAILS_FALLBACK').split(',')

    return if message.to.all? { |email| email.in? authorized_emails }

    message.subject = "#{message.to} #{message.subject}"
    message.to = email_fallback
  end
end

unless ENV['EMAIL_NO_INTERCEPTOR'] == 'true' || Rails.env.test?
  ActionMailer::Base.register_interceptor(EmailInterceptor)
end

unless Rails.env.test?

  smtp_settings = case Rails.env
                  when 'development' then
                    {
                      address: 'localhost', # installer mailcatcher sur son ordi, mais pas dans le Gemfile
                      port: 1025
                    }
                  when 'production'
                    {
                      # address: 'in-v3.mailjet.com', # TODO, mettre les infos de votre fournisseurs
                      # enable_starttls_auto: true,
                      # port: 587,
                      # authentication: 'plain',
                      # user_name: ENV['SMTP_USERNAME'],
                      # password: ENV['SMTP_PASSWORD']
                    }
                  end

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings   = smtp_settings
  ActionMailer::Base.default_options = { from: ENV['EMAIL_SENDER'] } #  EMAIL_SENDER = contact@carotte.com ?
end
